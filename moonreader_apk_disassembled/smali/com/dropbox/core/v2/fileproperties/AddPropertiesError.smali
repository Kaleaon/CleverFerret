.class public final Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;
.super Ljava/lang/Object;
.source "AddPropertiesError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;,
        Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;
    }
.end annotation


# static fields
.field public static final DOES_NOT_FIT_TEMPLATE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

.field public static final DUPLICATE_PROPERTY_GROUPS:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

.field public static final OTHER:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

.field public static final PROPERTY_FIELD_TOO_LARGE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

.field public static final PROPERTY_GROUP_ALREADY_EXISTS:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

.field public static final RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

.field public static final UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

.field private templateNotFoundValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->OTHER:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->PROPERTY_FIELD_TOO_LARGE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->PROPERTY_FIELD_TOO_LARGE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    .line 102
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->DOES_NOT_FIT_TEMPLATE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->DOES_NOT_FIT_TEMPLATE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    .line 107
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->DUPLICATE_PROPERTY_GROUPS:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->DUPLICATE_PROPERTY_GROUPS:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    .line 111
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->PROPERTY_GROUP_ALREADY_EXISTS:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->PROPERTY_GROUP_ALREADY_EXISTS:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;)Ljava/lang/String;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->templateNotFoundValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;)Lcom/dropbox/core/v2/fileproperties/LookupError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/fileproperties/LookupError;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;
    .locals 2

    if-eqz p0, :cond_0

    .line 287
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->PATH:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTagAndPath(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;Lcom/dropbox/core/v2/fileproperties/LookupError;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object p0

    return-object p0

    .line 285
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static templateNotFound(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;
    .locals 2

    if-eqz p0, :cond_2

    .line 210
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 213
    const-string v0, "(/|ptid:).*"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 216
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->withTagAndTemplateNotFound(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    move-result-object p0

    return-object p0

    .line 214
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 211
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 208
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;
    .locals 1

    .line 129
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    .line 130
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;Lcom/dropbox/core/v2/fileproperties/LookupError;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;
    .locals 1

    .line 160
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    .line 161
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    .line 162
    iput-object p2, v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    return-object v0
.end method

.method private withTagAndTemplateNotFound(Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;
    .locals 1

    .line 145
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;-><init>()V

    .line 146
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    .line 147
    iput-object p2, v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->templateNotFoundValue:Ljava/lang/String;

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

    .line 379
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    if-eqz v2, :cond_7

    .line 380
    check-cast p1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;

    .line 381
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 384
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$AddPropertiesError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 392
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    :pswitch_2
    return v0

    .line 386
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->templateNotFoundValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->templateNotFoundValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    :cond_7
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getPathValue()Lcom/dropbox/core/v2/fileproperties/LookupError;
    .locals 3

    .line 299
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->PATH:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    .line 302
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    return-object v0

    .line 300
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTemplateNotFoundValue()Ljava/lang/String;
    .locals 3

    .line 231
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->templateNotFoundValue:Ljava/lang/String;

    return-object v0

    .line 232
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEMPLATE_NOT_FOUND, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 362
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->templateNotFoundValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

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

    .line 367
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isDoesNotFitTemplate()Z
    .locals 2

    .line 335
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->DOES_NOT_FIT_TEMPLATE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDuplicatePropertyGroups()Z
    .locals 2

    .line 346
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->DUPLICATE_PROPERTY_GROUPS:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 256
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 267
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->PATH:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPropertyFieldTooLarge()Z
    .locals 2

    .line 324
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->PROPERTY_FIELD_TOO_LARGE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPropertyGroupAlreadyExists()Z
    .locals 2

    .line 357
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->PROPERTY_GROUP_ALREADY_EXISTS:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRestrictedContent()Z
    .locals 2

    .line 245
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTemplateNotFound()Z
    .locals 2

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnsupportedFolder()Z
    .locals 2

    .line 313
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;->UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 414
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 426
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/AddPropertiesError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
