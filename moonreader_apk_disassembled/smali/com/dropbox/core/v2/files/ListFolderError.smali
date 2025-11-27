.class public final Lcom/dropbox/core/v2/files/ListFolderError;
.super Ljava/lang/Object;
.source "ListFolderError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/ListFolderError$Serializer;,
        Lcom/dropbox/core/v2/files/ListFolderError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/ListFolderError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;

.field private templateErrorValue:Lcom/dropbox/core/v2/fileproperties/TemplateError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 57
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ListFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->OTHER:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ListFolderError;->withTag(Lcom/dropbox/core/v2/files/ListFolderError$Tag;)Lcom/dropbox/core/v2/files/ListFolderError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ListFolderError;->OTHER:Lcom/dropbox/core/v2/files/ListFolderError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/ListFolderError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/ListFolderError;)Lcom/dropbox/core/v2/fileproperties/TemplateError;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->templateErrorValue:Lcom/dropbox/core/v2/fileproperties/TemplateError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ListFolderError;
    .locals 2

    if-eqz p0, :cond_0

    .line 156
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ListFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->PATH:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/ListFolderError;->withTagAndPath(Lcom/dropbox/core/v2/files/ListFolderError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ListFolderError;

    move-result-object p0

    return-object p0

    .line 154
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static templateError(Lcom/dropbox/core/v2/fileproperties/TemplateError;)Lcom/dropbox/core/v2/files/ListFolderError;
    .locals 2

    if-eqz p0, :cond_0

    .line 202
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ListFolderError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->TEMPLATE_ERROR:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/ListFolderError;->withTagAndTemplateError(Lcom/dropbox/core/v2/files/ListFolderError$Tag;Lcom/dropbox/core/v2/fileproperties/TemplateError;)Lcom/dropbox/core/v2/files/ListFolderError;

    move-result-object p0

    return-object p0

    .line 200
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/ListFolderError$Tag;)Lcom/dropbox/core/v2/files/ListFolderError;
    .locals 1

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ListFolderError;-><init>()V

    .line 76
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/ListFolderError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ListFolderError;
    .locals 1

    .line 89
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ListFolderError;-><init>()V

    .line 90
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    .line 91
    iput-object p2, v0, Lcom/dropbox/core/v2/files/ListFolderError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0
.end method

.method private withTagAndTemplateError(Lcom/dropbox/core/v2/files/ListFolderError$Tag;Lcom/dropbox/core/v2/fileproperties/TemplateError;)Lcom/dropbox/core/v2/files/ListFolderError;
    .locals 1

    .line 104
    new-instance v0, Lcom/dropbox/core/v2/files/ListFolderError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ListFolderError;-><init>()V

    .line 105
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    .line 106
    iput-object p2, v0, Lcom/dropbox/core/v2/files/ListFolderError;->templateErrorValue:Lcom/dropbox/core/v2/fileproperties/TemplateError;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 250
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/ListFolderError;

    if-eqz v2, :cond_a

    .line 251
    check-cast p1, Lcom/dropbox/core/v2/files/ListFolderError;

    .line 252
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 255
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/ListFolderError$1;->$SwitchMap$com$dropbox$core$v2$files$ListFolderError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 259
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ListFolderError;->templateErrorValue:Lcom/dropbox/core/v2/fileproperties/TemplateError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/ListFolderError;->templateErrorValue:Lcom/dropbox/core/v2/fileproperties/TemplateError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/TemplateError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 257
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ListFolderError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/ListFolderError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    :cond_a
    return v1
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->PATH:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    if-ne v0, v1, :cond_0

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 169
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTemplateErrorValue()Lcom/dropbox/core/v2/fileproperties/TemplateError;
    .locals 3

    .line 215
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->TEMPLATE_ERROR:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    if-ne v0, v1, :cond_0

    .line 218
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->templateErrorValue:Lcom/dropbox/core/v2/fileproperties/TemplateError;

    return-object v0

    .line 216
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEMPLATE_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ListFolderError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ListFolderError;->templateErrorValue:Lcom/dropbox/core/v2/fileproperties/TemplateError;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 229
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->OTHER:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 136
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->PATH:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTemplateError()Z
    .locals 2

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ListFolderError$Tag;->TEMPLATE_ERROR:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/ListFolderError$Tag;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListFolderError;->_tag:Lcom/dropbox/core/v2/files/ListFolderError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 273
    sget-object v0, Lcom/dropbox/core/v2/files/ListFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ListFolderError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 285
    sget-object v0, Lcom/dropbox/core/v2/files/ListFolderError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListFolderError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ListFolderError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
