# titiler-agol

Many of the files in this repo are cribbed directly from [titiler](https://github.com/develompmentseed/titiler) itself.

## Usage

To deploy:

```shell
pip install -r requirements-cdk.txt
npm install
npm run cdk -- bootstrap # Only needs to be done once
npm run cdk -- synth
export TITILER_STACK_NAME="mytiler"
export TITILER_STACK_STAGE="dev"
export TITILER_STACK_MEMORY=512
npm run cdk -- deploy mytiler-lambda-dev
```

To destroy:

```shell
npm run cdk -- destroy mytiler-lambda-dev
```
