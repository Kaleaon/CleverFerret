.class public final Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;
.super Ljava/lang/Object;
.source "RemovePropertiesError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;,
        Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

.field public static final RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

.field public static final UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

.field private propertyGroupLookupValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

.field private templateNotFoundValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 62
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    .line 70
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->OTHER:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->withTag(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;)Ljava/lang/String;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->templateNotFoundValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;)Lcom/dropbox/core/v2/fileproperties/LookupError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;)Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->propertyGroupLookupValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/fileproperties/LookupError;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;
    .locals 2

    if-eqz p0, :cond_0

    .line 267
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->PATH:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->withTagAndPath(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;Lcom/dropbox/core/v2/fileproperties/LookupError;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    move-result-object p0

    return-object p0

    .line 265
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static propertyGroupLookup(Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;
    .locals 2

    if-eqz p0, :cond_0

    .line 324
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->PROPERTY_GROUP_LOOKUP:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->withTagAndPropertyGroupLookup(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    move-result-object p0

    return-object p0

    .line 322
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static templateNotFound(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;
    .locals 2

    if-eqz p0, :cond_2

    .line 190
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 193
    const-string v0, "(/|ptid:).*"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->withTagAndTemplateNotFound(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    move-result-object p0

    return-object p0

    .line 194
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 191
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 188
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;
    .locals 1

    .line 94
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    .line 95
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;Lcom/dropbox/core/v2/fileproperties/LookupError;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;
    .locals 1

    .line 125
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    .line 126
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    .line 127
    iput-object p2, v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    return-object v0
.end method

.method private withTagAndPropertyGroupLookup(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;
    .locals 1

    .line 140
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    .line 141
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    .line 142
    iput-object p2, v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->propertyGroupLookupValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    return-object v0
.end method

.method private withTagAndTemplateNotFound(Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;
    .locals 1

    .line 110
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;-><init>()V

    .line 111
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    .line 112
    iput-object p2, v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->templateNotFoundValue:Ljava/lang/String;

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

    .line 363
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    if-eqz v2, :cond_9

    .line 364
    check-cast p1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;

    .line 365
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 368
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$RemovePropertiesError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    .line 380
    :pswitch_0
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->propertyGroupLookupValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->propertyGroupLookupValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    :pswitch_1
    return v0

    .line 376
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    :pswitch_3
    return v0

    .line 370
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->templateNotFoundValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->templateNotFoundValue:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    :cond_9
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getPathValue()Lcom/dropbox/core/v2/fileproperties/LookupError;
    .locals 3

    .line 279
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->PATH:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    .line 282
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    return-object v0

    .line 280
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPropertyGroupLookupValue()Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;
    .locals 3

    .line 337
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->PROPERTY_GROUP_LOOKUP:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    .line 340
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->propertyGroupLookupValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    return-object v0

    .line 338
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PROPERTY_GROUP_LOOKUP, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTemplateNotFoundValue()Ljava/lang/String;
    .locals 3

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    .line 214
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->templateNotFoundValue:Ljava/lang/String;

    return-object v0

    .line 212
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEMPLATE_NOT_FOUND, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 345
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->templateNotFoundValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->pathValue:Lcom/dropbox/core/v2/fileproperties/LookupError;

    iget-object v3, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->propertyGroupLookupValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 351
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isOther()Z
    .locals 2

    .line 236
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 247
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->PATH:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPropertyGroupLookup()Z
    .locals 2

    .line 304
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->PROPERTY_GROUP_LOOKUP:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRestrictedContent()Z
    .locals 2

    .line 225
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTemplateNotFound()Z
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnsupportedFolder()Z
    .locals 2

    .line 293
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;->UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;
    .locals 1

    .line 158
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError;->_tag:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 392
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 404
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/RemovePropertiesError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
