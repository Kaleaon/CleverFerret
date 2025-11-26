.class public Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;
.super Ljava/lang/Object;
.source "TemplatesUpdateForTeamBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/fileproperties/DbxTeamFilePropertiesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/fileproperties/DbxTeamFilePropertiesRequests;Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;->_client:Lcom/dropbox/core/v2/fileproperties/DbxTeamFilePropertiesRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;->_builder:Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

    return-void

    .line 36
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 32
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/fileproperties/UpdateTemplateResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/fileproperties/ModifyTemplateErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;->_builder:Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->build()Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg;

    move-result-object v0

    .line 89
    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;->_client:Lcom/dropbox/core/v2/fileproperties/DbxTeamFilePropertiesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/fileproperties/DbxTeamFilePropertiesRequests;->templatesUpdateForTeam(Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg;)Lcom/dropbox/core/v2/fileproperties/UpdateTemplateResult;

    move-result-object v0

    return-object v0
.end method

.method public withAddFields(Ljava/util/List;)Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyFieldTemplate;",
            ">;)",
            "Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;"
        }
    .end annotation

    .line 80
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;->_builder:Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->withAddFields(Ljava/util/List;)Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;->_builder:Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

    return-object p0
.end method

.method public withName(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplatesUpdateForTeamBuilder;->_builder:Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->withName(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;

    return-object p0
.end method
