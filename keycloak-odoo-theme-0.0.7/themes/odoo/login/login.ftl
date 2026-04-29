<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <img class="som-logo-img" src="${url.resourcesPath}/img/Somcomunitats-logo.svg" alt="Som Comunitats Logo" />
    <#elseif section = "form">
    <h1 id="kc-page-title">
        ${msg("loginAccountTitle")}
    </h1>
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}&ui_locales=ca" method="post">
                <#if !usernameHidden??>
                    <div class="${properties.kcFormGroupClass!}">
                        <input
                            tabindex="1"
                            placeholder="${msg("username")}"
                            id="username"
                            class="${properties.kcInputClass!} <#if messagesPerField.existsError('username','password')>input-error<#else>input</#if>"
                            name="username"
                            value="${(login.username!'')}"
                            type="text"
                            autofocus
                            autocomplete="off"
                        />
                    </div>
                </#if>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="<#if messagesPerField.existsError('username','password')>password-wrapper-error<#else>password-wrapper</#if>">
                        <input
                            class="input"
                            tabindex="2"
                            placeholder="${msg("password")}"
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="off"
                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                        <i class="fa fa-eye" id="togglePassword"></i>
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="${properties.kcFormOptionsWrapperClass!}">
                    <#if realm.resetPasswordAllowed>
                        <span><a class="link" tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <#if realm.rememberMe && !usernameHidden??>
                        <div class="checkbox">
                            <label>
                                <#if login.rememberMe??>
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                <#else>
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                </#if>
                            </label>
                        </div>
                    </#if>
                </div>
                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                </div>
            </form>
        </#if>
       </div>

    </div>
    </#if>

</@layout.registrationLayout>


