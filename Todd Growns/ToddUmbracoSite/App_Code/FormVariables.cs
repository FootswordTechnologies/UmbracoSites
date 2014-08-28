using umbraco;

/// <summary>
/// Summary description for FormVariables
/// </summary>
public class FormVariables
{
    public FormVariables(dynamic parameter, dynamic model)
    {
        var modelMailFrom = model.MailFrom.GetType() != typeof(umbraco.MacroEngines.DynamicNull) ? model.MailFrom : string.Empty;
        var modelMailFromName = model.MailFromName.GetType() != typeof(umbraco.MacroEngines.DynamicNull) ? model.MailFromName : string.Empty;

        MailFrom = GetParamValue(parameter.MailFrom) ?? GetParamValue(modelMailFrom);
        MailFromName = GetParamValue(parameter.MailFromName) ?? GetParamValue(modelMailFromName);

        Name = GetParamValue(parameter.FormLabelName) ?? "Name";
        Email = GetParamValue(parameter.FormLabelEmail) ?? "E-mail";
        Message = GetParamValue(parameter.FormLabelMessage) ?? "Message";
        SendCopy = GetParamValue(parameter.FormLabelSendCopy) ?? "Send me a copy of this mail";
        Address1 = GetParamValue(parameter.Address1) ?? "Address";
        Address2 = GetParamValue(parameter.Address2) ?? "Address Line 2";

        ErrorsInForm = GetParamValue(parameter.FormValidationError) ?? "Please check the highlighted fields for errors";
        ErrorSendingForm = GetParamValue(parameter.FormGenericError) ?? "There was a technical error sending the form, please try again or contact us in an alternative way.";

        MailSubject = GetParamValue(parameter.MailSubject) ?? "Contact mail";
        MailIntroText = GetParamValue(parameter.MailIntroText) ?? "A contact mail has been submitted with the following details:";

        MailSubjectCopyToSender = GetParamValue(parameter.MailSubjectCopyToSender) ?? "Copy of contact mail";
        MailIntroTextCopyToSender = GetParamValue(parameter.MailIntroTextCopyToSender) ?? "You have contacted us with the information below, we will get back to you soon.";

        FormSentConfirmation = GetParamValue(parameter.FormSentConfirmation) ?? "Thank you, we will get back to you soon.";

        RedirectUrl = GetParamValue(parameter.RedirectUrl) ?? model.Url + "?form-posted=1";

        SubmitButtonTitle = GetParamValue(parameter.SubmitButtonTitle) ?? "Submit";

        bool enableSsl;
        bool.TryParse(parameter.EnableSsl, out enableSsl);
        EnableSsl = enableSsl;

        NameFieldName = "name-req";
        NameFieldError = GetParamValue(parameter.NameFieldError) ?? "Please enter your name";
        EmailFieldName = "email-req-mail";
        EmailFieldError = GetParamValue(parameter.EmailFieldError) ?? "Please enter a valid e-mail address";
        MessageFieldName = "message-req";
        MessageFieldError = GetParamValue(parameter.MessageFieldError) ?? "Please enter a message";
        SendCopyFieldName = "sendcopy";
        Address1FieldName = "address1-req";
        Address2FieldName = "address2";
        AddressFieldError = GetParamValue(parameter.AddressFieldError) ?? "Please enter a UK addresss";
    }

    public string MailFrom { get; set; }
    public string MailFromName { get; set; }

    public string Name { get; set; }
    public string Email { get; set; }
    public string Message { get; set; }
    public string SendCopy { get; set; }

    public string ErrorsInForm { get; set; }
    public string ErrorSendingForm { get; set; }

    public string MailSubject { get; set; }
    public string MailIntroText { get; set; }

    public string MailSubjectCopyToSender { get; set; }
    public string MailIntroTextCopyToSender { get; set; }

    public string FormSentConfirmation { get; set; }

    public string RedirectUrl { get; set; }
    public bool EnableSsl { get; set; }

    public string NameFieldName { get; set; }
    public string NameFieldError { get; set; }
    public string EmailFieldName { get; set; }
    public string EmailFieldError { get; set; }
    public string Address1 { get; set; }
    public string Address1FieldName { get; set; }
    public string Address2 { get; set; }
    public string Address2FieldName { get; set; }
    public string AddressFieldError { get; set; }
    public string MessageFieldName { get; set; }
    public string MessageFieldError { get; set; }
    public string SendCopyFieldName { get; set; }
    public string SubmitButtonTitle { get; set; }

    public static string GetParamValue(dynamic input)
    {
        if (input != null && input.StartsWith("[!") && input.EndsWith("]"))
        {
            var dictKey = input.Substring(2, input.LastIndexOf("]") - 2);
            input = library.GetDictionaryItem(dictKey);
        }

        return input;
    }
}