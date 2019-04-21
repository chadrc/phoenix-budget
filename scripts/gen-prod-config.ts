import * as AWS from 'aws-sdk';
import * as fs from 'fs';
import * as path from 'path';

const ssm = new AWS.SSM({region: "us-east-1"});

const writeTemplate = ({secret, username, password, database}) => `\
use Mix.Config

config :phoenix_budget, PhoenixBudgetWeb.Endpoint,
  secret_key_base: "${secret}"

config :phoenix_budget, PhoenixBudget.Repo,
  username: "${username}",
  password: "${password}",
  database: "${database}",
  pool_size: 15
`;

(async () => {
  const prefix = '/phoenix-budget'; // no trailing slash to match what IAM needs for permissions
  const params = (await ssm.getParametersByPath({
    Path: prefix,
    Recursive: true
  }).promise()).Parameters.reduce((prev, curr) => {
    const name = curr.Name.replace(`${prefix}/`, '').replace(/\//g, '.');
    prev[name] = curr.Value;
    return prev;
  }, {});

  console.log(params);

  const template = writeTemplate({
    secret: params['secret-key-base'],
    username: params['prod.database-username'],
    password: params['prod.database-password'],
    database: params['prod.database-name']
  });

  const filePath = path.resolve(__dirname, "../config/prod.secret.exs");

  fs.writeFileSync(filePath, template);
})().catch((error) => {
  console.error(error);
  process.exit(1);
});
