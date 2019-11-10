<%@ Control language="C#" Inherits="DotNetNuke.Modules.Journal.View" AutoEventWireup="false"  Codebehind="View.ascx.cs" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Register Namespace="DotNetNuke.Modules.Journal.Controls" Assembly="DotNetNuke.Modules.Journal" TagPrefix="dnnj" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<div id="userFileManager"></div>

<dnn:DnnJsInclude runat="server" FilePath="~/Resources/Shared/Components/UserFileManager/jquery.dnnUserFileUpload.js" Priority="102" AddTag="false" />
<dnn:DnnJsInclude runat="server" FilePath="~/Resources/Shared/Components/UserFileManager/UserFileManager.js" Priority="105" AddTag="false"></dnn:DnnJsInclude>
<dnn:DnnCssInclude runat="server" FilePath="~/Resources/Shared/Components/UserFileManager/UserFileManager.css" AddTag="false"></dnn:DnnCssInclude>

<% if (ShowEditor) {  %>
<div class="journalTools">
    <div id="journalEditor" class="journalToolsEditor">
        <div id="journalClose" class="journalClose"></div>
        <textarea id="journalContent" aria-label="Content" class="journalContentr"></textarea>
        <div id="tbar" class="tbar">
            <span id="tbar-perm" class="tbarPerm"></span>
            <% if (AllowFiles) {  %>
            <span id="tbar-attach" class="tbarAttach"></span>
            <% } %>
            <% if (AllowPhotos) {  %>
            <span id="tbar-photo" class="tbarPhoto"></span>
            <%}%>
            <div class="securityMenu journalSecurityMenu dnnClear">
                <div class="handle journalHandle"></div>
                <ul class="securityMenuList journalSecurityMenuList">
                    <li class="securityMenuListItem  journalListItem journalListItemPrivacy"><b><%= LocalizeString("WhoWillSee.Text") %></b></li>
                    <% if (IsGroup && !IsPublicGroup)
                    { %>
                    <li class="securityMenuListItem journalListItem journalListItemPrivacyGroupMembers"><input type="radio" name="privacy" value="R" checked="checked" aria-label="Security" /><%= LocalizeString("GroupMembers.Text") %></li>
                    <% }
                    else
                    { %>
                    <li class="securityMenuListItem journalListItem journalListItemPrivacyEveryone"><input type="radio" name="privacy" value="E" checked="checked" aria-label="Security" /><%= LocalizeString("Everyone.Text") %></li>
                    <li class="securityMenuListItem journalListItem journalListItemPrivacyCommunity"><input type="radio" name="privacy" value="C" aria-label="Security" /><%= LocalizeString("Community.Text") %></li>
                    <li class="securityMenuListItem journalListItem journalListItemPrivacyFriends"><input type="radio" name="privacy" value="F" aria-label="Security" /><%= LocalizeString("Friends.Text") %></li>
                    <% if (!IsGroup) { %>
                    <li class="securityMenuListItem journalListItem journalListItemPrivacyPrivate"><input type="radio" name="privacy" value="U" aria-label="Security" /><%= LocalizeString("Private.Text") %></li>
                    <% } %>
                    <% } %>
                </ul>
            </div>
        </div>
        <a href="#" id="btnShare" class="journalBtnShare" aria-label="Share"><%= LocalizeString("Share.Text") %></a>
        <div id="journalPlaceholder" class="journalPlaceholder><%= LocalizeString("SharePlaceHolder.Text") %></div>
        <div class="journalDiv dnnClear"></div>
    </div>
    <div id="journalOptionArea" class="journalOptionArea">
        <% if (AllowFiles || AllowPhotos) { %>
        <div class="fileUploadArea journalFileUploadArea">
            <div class="jpa journalTbarAttachArea" id="tbar-attach-Area">
                <div class="journal_onlineFileShare">
                    <span id="tbar-photoText" class="journalPhotoText"><%= LocalizeString("SelectPhoto.Text") %></span> 
                    <span id="tbar-fileText" class="journalFileText"><%= LocalizeString("SelectFile.Text") %></span>
                    <div class="journalPhotoFromSite">
                        <a href="javascript:void(0)" id="photoFromSite" class="dnnSecondaryAction journalSecondaryAction journalSecondaryActionPhotoFromSite"><%= LocalizeString("BrowseFromSite.Text") %></a> 
                    </div>
                </div>
                <div class="journal_localFileShare">
                    <span class="browser-upload-btn journalBrowserUploadButton"><%= LocalizeString("UploadFromLocal.Text") %></span>
                    <input id="uploadFileId" type="file" name="files[]" aria-label="Upload" />
                </div>
                <div style="clear:both; padding: 0; margin: 0;" class="journalDivBelowJournalBrowserUploadButton"></div>
            </div>
            <div id="itemUpload" class="journalItemUpload">
                <div class="fileupload-error dnnFormMessage dnnFormValidationSummary journal" style="display:none;"></div>
                <div class="progress_bar_wrapper">
                        <div class="progress_context" style="margin:10px 0px; display:none;">
                            <div class="upload_file_name journalUploadFileName" style="margin-top:5px; margin-bottom:-5px;"></div>
                            <div class="progress-bar green journalProgressBarColor">
                                <div style="width:0px;" class="journalProgressBarDiv">
                                    <span class="journalProgressBarSpan"></span> 
                                </div>
                            </div>
                        </div>
                    </div>
                
                <div class="filePreviewArea journalFilePreviewArea"></div>
            </div>
        </div>
        <% } %>
        <div class="jpa journalLinkArea" id="linkArea">
            <div id="linkClose" class="journalLinkClose"></div>
            <div id="imagePreviewer" class="journalImagePreviewer">
                <div id="image" class="journalImage">
                    <img src='' alt="Preview" />
                </div>
                <span id="imgPrev" class=journalImagePreview"><<</span><span id="imgCount" class="journalImgCounty">1 <%= LocalizeString("Of.Text") %> 10</span><span id="imgNext" class="journalImgNext">>></span>
            </div>
            <div id="linkInfo" class="journalLinkInfo">
                <b></b>
                <p></p>
            </div>
            <div class="dnnClear"></div>
        </div>
    </div>
</div>
<div class="dnnClear"></div>


<%} %>

<div id="journalItems" class="journalItems">
    <dnnj:JournalListControl ID="ctlJournalList" runat="server" CssClass="journalItemsList"/>
</div>
<a href="#" style="display:none;" id="getMore" class="dnnPrimaryAction journalPrimaryAction"><%= LocalizeString("GetMore.Text") %></a>

<script type="text/javascript">
    var InputFileNS = {};
    InputFileNS.initilizeInput = function() {
        var $fileUpload = $('.fileUploadArea :file');
        $fileUpload.data("text", '<%=LocalizeSafeJsString("ChooseFile.Text")%>');
        $fileUpload.dnnFileInput();
    };
    $(document).ready(function () {
        InputFileNS.initilizeInput();
    });

    var pagesize = <%= PageSize.ToString()%>;
    var profilePage ='<%= ProfilePage%>';
    var maxlength = <%= MaxMessageLength.ToString()%>;
    
    var baseUrl = '<%= BaseUrl %>'; 
    var resxLike ='<%= LocalizeSafeJsString("{resx:like}")%>';
    var resxUnLike ='<%= LocalizeSafeJsString("{resx:unlike}")%>';

    var pid = <%= Pid.ToString()%>;
    var gid = <%= Gid.ToString()%>;
    var ispublicgroup = <%= IsPublicGroup ? "true" : "false" %>;

    var journalOptions = {};
    journalOptions.servicesFramework = $.ServicesFramework(<%=ModuleId %>);
    journalOptions.confirmText = '<%= LocalizeSafeJsString("DeleteItem") %>';
    journalOptions.yesText = '<%= LocalizeSafeJsString("Yes.Text") %>';
    journalOptions.noText = '<%= LocalizeSafeJsString("No.Text") %>';
    journalOptions.title = '<%= LocalizeSafeJsString("Confirm.Text") %>';
    journalOptions.imageTypes = '<%= DotNetNuke.Common.Globals.glbImageFileTypes %>';

    var commentOpts = {};
    commentOpts.servicesFramework = $.ServicesFramework(<%=ModuleId %>);
    
    pluginInit();
    
    function setupJournal() {
        var sf = journalOptions.servicesFramework;
        var journalServiceBase = sf.getServiceRoot('Journal');
        
        $('.juser').click(function() {
            var uid =  $(this).attr('id').replace('user-', '');
            window.location.href = profilePage.replace('xxx',uid);
        });
        var maxUploadSize = <%=MaxUploadSize %>;
        
        $('.fileUploadArea').dnnUserFileUpload({
            maxFileSize: maxUploadSize,
            serverErrorMessage: '<%= LocalizeSafeJsString("ServerError.Text") %>',
            addImageServiceUrl: journalServiceBase + 'FileUpload/UploadFile',
            beforeSend: sf.setModuleHeaders,
            callback: function (result) {
                if (IsImage(result.extension)) {
                    attachPhoto(result.file_id, result.url, true);
                }else{
                    attachPhoto(result.file_id, result.thumbnail_url, false);
                }
            },
            complete: function () {
                InputFileNS.initilizeInput();
            }
        });
        var jopts = {};
        jopts.maxLength = maxlength;
        jopts.servicesFramework = sf;
        $('body').journalTools(jopts);
        
        $('#userFileManager').userFileManager({
            title: '<%= LocalizeSafeJsString("Title.Text") %>',
            cancelText: '<%= LocalizeSafeJsString("Cancel.Text") %>',
            attachText: '<%= LocalizeSafeJsString("Attach.Text") %>',
            getItemsServiceUrl: sf.getServiceRoot('InternalServices') + 'UserFile/GetItems',
            nameHeaderText: '<%= LocalizeSafeJsString("Name.Header") %>',
            typeHeaderText: '<%= LocalizeSafeJsString("Type.Header") %>',
            lastModifiedHeaderText: '<%= LocalizeSafeJsString("LastModified.Header") %>',
            fileSizeText: '<%= LocalizeSafeJsString("FileSize.Header") %>',
            templatePath: '<%=Page.ResolveUrl("~/Resources/Shared/Components/UserFileManager/Templates/") %>',
            templateName: 'Default',
            templateExtension: '.html',
            attachCallback: function(file) {
                if (IsImage(file.type)) {
                    attachPhoto(file.id, file.thumb_url, true);
                } else {
                    attachPhoto(file.id, file.thumb_url, false);
                }
            }
        });
       
        var opts = {};
        opts.textareaSelector = '#journalContent';
        opts.clearPreviewSelector = '#linkClose';
        opts.previewSelector = '#linkArea';
        opts.servicesFramework = sf;

        $('body').previewify(opts);
    }

    $(document).ready(function () {
        setupJournal();
    });
</script>
