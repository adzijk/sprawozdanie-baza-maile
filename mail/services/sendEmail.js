const { createTransport } = require("nodemailer");
const path = require("path");

const sendEmails = async (emails, db) => {
  const { default: hbsNodemailer } = await import(
    "nodemailer-express-handlebars"
  );

  const transporter = createTransport({
    host: 'localhost',
    port: '',
    auth: {
      user: '',
      pass: '',
    },
  });

  transporter.use(
    "compile",
    hbsNodemailer({
      viewEngine: {
        extName: ".hbs",
        partialsDir: path.resolve("./views/partials"),
        defaultLayout: false,
      },
      viewPath: path.resolve("./views"),
      extName: ".hbs",
    })
  );

  for (const email of emails) {
    const user = await db.read(email);
    const mailOptions = {
      from: process.env.EMAIL_SENDER_USER,
      to: email,
      subject: "Lekcja 13",
      template: "email-template",
      context: {
        name: user[0].name,
      },
    };

    try {
      await transporter.sendMail(mailOptions);
      console.log(`email sent to: ${email}`);
    } catch (error) {
      console.error(`error email sending to: ${email}:`, error);
    }
  }
};

module.exports = { sendEmails };
