# Personal Access Token

## Contents
- [Reason](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/token.md#reason)
- [Create](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/token.md#create)
- [Recreate](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/token.md#recreate)

## Reason

In a nutshell, Microsoft wants increase Github's security by implementing Personal Access Tokens (PATs) as in place replacement for passwords when interacting with Git programs .

You can read yourself at Github's Blog [here](https://github.blog/2021-04-05-behind-githubs-new-authentication-token-formats/)

## Create

Before creating Personal Access Tokens, make sure you already verify your email address for your Github Account.

If not yet verified, see [here](https://docs.github.com/en/github/getting-started-with-github/verifying-your-email-address).

---

Click your account icon, the click **Settings**.

![images](images/ghp0.png)

---

Click **Developer settings**

![images](images/ghp1.png)

---

Choose **Personal Access Token**

![images](images/ghp2.png)

---

Choose **Generate new token**

![images](images/ghp3.png)

You may asked your Github Account password to continue

---

Now fill it

Essential contents:
- Note: As short descriptive name
- Expiration: How long token will available
- Select scopes: For simple usage, just check **repo**

![images](images/ghpgen.png)

---

Click Generate token

![images](images/ghpsave.png)

---

You will get your personal access token

![images](images/ghpresult.png)

**Notes:** Copy the token (ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) and paste it on somewhere else save.

After you leave or refresh that page, you **won't able** see that token characters again

---

**Tips:** You can also save it as Bash environment

Run this command like this once (either in ArchLinux's terminal or Git Bash in Windows)

```sh
echo "export GITHUBTOKEN=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> ~/.bashrc
source ~/.bashrc
```

Next, whenever you need your token, you can use command:

```sh
echo $GITHUBTOKEN
```

then copy it into your clipboard and paste it whenever you need it.

![images](images/ghpshtoken.png)

## Recreate

As Personal Access Token used as password in place replacement, you must treat these tokens like passwords.

For reasons below, you may need to delete existing personal access token
- Lost/Unsaved
- Leaked to someone else

You just need to delete existing token and repeat token creation process above.
