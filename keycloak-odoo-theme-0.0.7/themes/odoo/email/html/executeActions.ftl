<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
</#outputformat>

<html>
<body>
${kcSanitize(msg("executeActionsBodyHtml", link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration), user.getUsername(), user.getFirstName(), user.getLastName(), user.attributes.energy_community, user.attributes.energy_community_email))?no_esc}
</body>
</html>
