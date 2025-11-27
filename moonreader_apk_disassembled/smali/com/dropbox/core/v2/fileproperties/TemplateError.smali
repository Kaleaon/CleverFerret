.class public final Lcom/dropbox/core/v2/fileproperties/TemplateError;
.super Ljava/lang/Object;
.source "TemplateError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;,
        Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/fileproperties/TemplateError;

.field public static final RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/TemplateError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

.field private templateNotFoundValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 59
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/TemplateError;->withTag(Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;)Lcom/dropbox/core/v2/fileproperties/TemplateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/TemplateError;

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/TemplateError;->withTag(Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;)Lcom/dropbox/core/v2/fileproperties/TemplateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->OTHER:Lcom/dropbox/core/v2/fileproperties/TemplateError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/fileproperties/TemplateError;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->templateNotFoundValue:Ljava/lang/String;

    return-object p0
.end method

.method public static templateNotFound(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/TemplateError;
    .locals 2

    if-eqz p0, :cond_2

    .line 153
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 156
    const-string v0, "(/|ptid:).*"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/fileproperties/TemplateError;->withTagAndTemplateNotFound(Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/TemplateError;

    move-result-object p0

    return-object p0

    .line 157
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 154
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 151
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;)Lcom/dropbox/core/v2/fileproperties/TemplateError;
    .locals 1

    .line 84
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateError;-><init>()V

    .line 85
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    return-object v0
.end method

.method private withTagAndTemplateNotFound(Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/TemplateError;
    .locals 1

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateError;-><init>()V

    .line 101
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    .line 102
    iput-object p2, v0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->templateNotFoundValue:Ljava/lang/String;

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

    .line 219
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    if-eqz v2, :cond_7

    .line 220
    check-cast p1, Lcom/dropbox/core/v2/fileproperties/TemplateError;

    .line 221
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 224
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/fileproperties/TemplateError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$TemplateError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 226
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->templateNotFoundValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/TemplateError;->templateNotFoundValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getTemplateNotFoundValue()Ljava/lang/String;
    .locals 3

    .line 174
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    if-ne v0, v1, :cond_0

    .line 177
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->templateNotFoundValue:Ljava/lang/String;

    return-object v0

    .line 175
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEMPLATE_NOT_FOUND, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 204
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->templateNotFoundValue:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 199
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRestrictedContent()Z
    .locals 2

    .line 188
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTemplateNotFound()Z
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateError;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 242
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 254
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/TemplateError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
