.class public final Lcom/dropbox/core/v2/files/TagObject;
.super Ljava/lang/Object;
.source "TagObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/TagObject$Serializer;,
        Lcom/dropbox/core/v2/files/TagObject$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/TagObject;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

.field private userGeneratedTagValue:Lcom/dropbox/core/v2/files/UserGeneratedTag;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/files/TagObject;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/TagObject;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/TagObject$Tag;->OTHER:Lcom/dropbox/core/v2/files/TagObject$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/TagObject;->withTag(Lcom/dropbox/core/v2/files/TagObject$Tag;)Lcom/dropbox/core/v2/files/TagObject;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/TagObject;->OTHER:Lcom/dropbox/core/v2/files/TagObject;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/TagObject;)Lcom/dropbox/core/v2/files/UserGeneratedTag;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/files/TagObject;->userGeneratedTagValue:Lcom/dropbox/core/v2/files/UserGeneratedTag;

    return-object p0
.end method

.method public static userGeneratedTag(Lcom/dropbox/core/v2/files/UserGeneratedTag;)Lcom/dropbox/core/v2/files/TagObject;
    .locals 2

    if-eqz p0, :cond_0

    .line 146
    new-instance v0, Lcom/dropbox/core/v2/files/TagObject;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/TagObject;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/TagObject$Tag;->USER_GENERATED_TAG:Lcom/dropbox/core/v2/files/TagObject$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/TagObject;->withTagAndUserGeneratedTag(Lcom/dropbox/core/v2/files/TagObject$Tag;Lcom/dropbox/core/v2/files/UserGeneratedTag;)Lcom/dropbox/core/v2/files/TagObject;

    move-result-object p0

    return-object p0

    .line 144
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/TagObject$Tag;)Lcom/dropbox/core/v2/files/TagObject;
    .locals 1

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/files/TagObject;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/TagObject;-><init>()V

    .line 79
    iput-object p1, v0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    return-object v0
.end method

.method private withTagAndUserGeneratedTag(Lcom/dropbox/core/v2/files/TagObject$Tag;Lcom/dropbox/core/v2/files/UserGeneratedTag;)Lcom/dropbox/core/v2/files/TagObject;
    .locals 1

    .line 94
    new-instance v0, Lcom/dropbox/core/v2/files/TagObject;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/TagObject;-><init>()V

    .line 95
    iput-object p1, v0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    .line 96
    iput-object p2, v0, Lcom/dropbox/core/v2/files/TagObject;->userGeneratedTagValue:Lcom/dropbox/core/v2/files/UserGeneratedTag;

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

    .line 195
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/TagObject;

    if-eqz v2, :cond_7

    .line 196
    check-cast p1, Lcom/dropbox/core/v2/files/TagObject;

    .line 197
    iget-object v2, p0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 200
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/TagObject$1;->$SwitchMap$com$dropbox$core$v2$files$TagObject$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/TagObject$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 202
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/TagObject;->userGeneratedTagValue:Lcom/dropbox/core/v2/files/UserGeneratedTag;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/TagObject;->userGeneratedTagValue:Lcom/dropbox/core/v2/files/UserGeneratedTag;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/UserGeneratedTag;->equals(Ljava/lang/Object;)Z

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

.method public getUserGeneratedTagValue()Lcom/dropbox/core/v2/files/UserGeneratedTag;
    .locals 3

    .line 161
    iget-object v0, p0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/TagObject$Tag;->USER_GENERATED_TAG:Lcom/dropbox/core/v2/files/TagObject$Tag;

    if-ne v0, v1, :cond_0

    .line 164
    iget-object v0, p0, Lcom/dropbox/core/v2/files/TagObject;->userGeneratedTagValue:Lcom/dropbox/core/v2/files/UserGeneratedTag;

    return-object v0

    .line 162
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_GENERATED_TAG, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/TagObject$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 180
    iget-object v0, p0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/TagObject;->userGeneratedTagValue:Lcom/dropbox/core/v2/files/UserGeneratedTag;

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

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/TagObject$Tag;->OTHER:Lcom/dropbox/core/v2/files/TagObject$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserGeneratedTag()Z
    .locals 2

    .line 126
    iget-object v0, p0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/TagObject$Tag;->USER_GENERATED_TAG:Lcom/dropbox/core/v2/files/TagObject$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/TagObject$Tag;
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/files/TagObject;->_tag:Lcom/dropbox/core/v2/files/TagObject$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 216
    sget-object v0, Lcom/dropbox/core/v2/files/TagObject$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/TagObject$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 228
    sget-object v0, Lcom/dropbox/core/v2/files/TagObject$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/TagObject$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/TagObject$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
