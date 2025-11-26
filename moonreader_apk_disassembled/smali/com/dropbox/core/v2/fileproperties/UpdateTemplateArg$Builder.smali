.class public Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;
.super Ljava/lang/Object;
.source "UpdateTemplateArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected addFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyFieldTemplate;",
            ">;"
        }
    .end annotation
.end field

.field protected description:Ljava/lang/String;

.field protected name:Ljava/lang/String;

.field protected final templateId:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 177
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 180
    const-string v0, "(/|ptid:).*"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->templateId:Ljava/lang/String;

    const/4 p1, 0x0

    .line 184
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->name:Ljava/lang/String;

    .line 185
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->description:Ljava/lang/String;

    .line 186
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->addFields:Ljava/util/List;

    return-void

    .line 181
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'templateId\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 178
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'templateId\' is shorter than 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 175
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'templateId\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg;
    .locals 5

    .line 246
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->templateId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->description:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->addFields:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method

.method public withAddFields(Ljava/util/List;)Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyFieldTemplate;",
            ">;)",
            "Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 229
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/fileproperties/PropertyFieldTemplate;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 231
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'addFields\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 235
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->addFields:Ljava/util/List;

    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;
    .locals 0

    .line 211
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public withName(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;
    .locals 0

    .line 198
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/UpdateTemplateArg$Builder;->name:Ljava/lang/String;

    return-object p0
.end method
