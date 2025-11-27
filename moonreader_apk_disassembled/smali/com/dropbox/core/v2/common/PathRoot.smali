.class public final Lcom/dropbox/core/v2/common/PathRoot;
.super Ljava/lang/Object;
.source "PathRoot.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/common/PathRoot$Serializer;,
        Lcom/dropbox/core/v2/common/PathRoot$Tag;
    }
.end annotation


# static fields
.field public static final HOME:Lcom/dropbox/core/v2/common/PathRoot;

.field public static final OTHER:Lcom/dropbox/core/v2/common/PathRoot;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

.field private namespaceIdValue:Ljava/lang/String;

.field private rootValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/common/PathRoot;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/PathRoot;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->HOME:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/common/PathRoot;->withTag(Lcom/dropbox/core/v2/common/PathRoot$Tag;)Lcom/dropbox/core/v2/common/PathRoot;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/common/PathRoot;->HOME:Lcom/dropbox/core/v2/common/PathRoot;

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/common/PathRoot;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/PathRoot;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->OTHER:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/common/PathRoot;->withTag(Lcom/dropbox/core/v2/common/PathRoot$Tag;)Lcom/dropbox/core/v2/common/PathRoot;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/common/PathRoot;->OTHER:Lcom/dropbox/core/v2/common/PathRoot;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/common/PathRoot;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/common/PathRoot;->rootValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/common/PathRoot;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/common/PathRoot;->namespaceIdValue:Ljava/lang/String;

    return-object p0
.end method

.method public static namespaceId(Ljava/lang/String;)Lcom/dropbox/core/v2/common/PathRoot;
    .locals 2

    if-eqz p0, :cond_1

    .line 252
    const-string v0, "[-_0-9a-zA-Z:]+"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    new-instance v0, Lcom/dropbox/core/v2/common/PathRoot;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/PathRoot;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->NAMESPACE_ID:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/common/PathRoot;->withTagAndNamespaceId(Lcom/dropbox/core/v2/common/PathRoot$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/common/PathRoot;

    move-result-object p0

    return-object p0

    .line 253
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 250
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static root(Ljava/lang/String;)Lcom/dropbox/core/v2/common/PathRoot;
    .locals 2

    if-eqz p0, :cond_1

    .line 196
    const-string v0, "[-_0-9a-zA-Z:]+"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    new-instance v0, Lcom/dropbox/core/v2/common/PathRoot;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/PathRoot;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->ROOT:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/common/PathRoot;->withTagAndRoot(Lcom/dropbox/core/v2/common/PathRoot$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/common/PathRoot;

    move-result-object p0

    return-object p0

    .line 197
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 194
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/common/PathRoot$Tag;)Lcom/dropbox/core/v2/common/PathRoot;
    .locals 1

    .line 95
    new-instance v0, Lcom/dropbox/core/v2/common/PathRoot;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/PathRoot;-><init>()V

    .line 96
    iput-object p1, v0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    return-object v0
.end method

.method private withTagAndNamespaceId(Lcom/dropbox/core/v2/common/PathRoot$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/common/PathRoot;
    .locals 1

    .line 130
    new-instance v0, Lcom/dropbox/core/v2/common/PathRoot;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/PathRoot;-><init>()V

    .line 131
    iput-object p1, v0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    .line 132
    iput-object p2, v0, Lcom/dropbox/core/v2/common/PathRoot;->namespaceIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndRoot(Lcom/dropbox/core/v2/common/PathRoot$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/common/PathRoot;
    .locals 1

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/common/PathRoot;

    invoke-direct {v0}, Lcom/dropbox/core/v2/common/PathRoot;-><init>()V

    .line 113
    iput-object p1, v0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    .line 114
    iput-object p2, v0, Lcom/dropbox/core/v2/common/PathRoot;->rootValue:Ljava/lang/String;

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

    .line 307
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/common/PathRoot;

    if-eqz v2, :cond_a

    .line 308
    check-cast p1, Lcom/dropbox/core/v2/common/PathRoot;

    .line 309
    iget-object v2, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 312
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/common/PathRoot$1;->$SwitchMap$com$dropbox$core$v2$common$PathRoot$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/common/PathRoot$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_9

    const/4 v3, 0x2

    if-eq v2, v3, :cond_7

    const/4 v3, 0x3

    if-eq v2, v3, :cond_4

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 318
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/common/PathRoot;->namespaceIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/common/PathRoot;->namespaceIdValue:Ljava/lang/String;

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

    .line 316
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/common/PathRoot;->rootValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/common/PathRoot;->rootValue:Ljava/lang/String;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public getNamespaceIdValue()Ljava/lang/String;
    .locals 3

    .line 272
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->NAMESPACE_ID:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    if-ne v0, v1, :cond_0

    .line 275
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->namespaceIdValue:Ljava/lang/String;

    return-object v0

    .line 273
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NAMESPACE_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/common/PathRoot$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRootValue()Ljava/lang/String;
    .locals 3

    .line 215
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->ROOT:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    if-ne v0, v1, :cond_0

    .line 218
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->rootValue:Ljava/lang/String;

    return-object v0

    .line 216
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ROOT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/common/PathRoot$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 291
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/common/PathRoot;->rootValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/common/PathRoot;->namespaceIdValue:Ljava/lang/String;

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

.method public isHome()Z
    .locals 2

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->HOME:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNamespaceId()Z
    .locals 2

    .line 229
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->NAMESPACE_ID:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 286
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->OTHER:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRoot()Z
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    sget-object v1, Lcom/dropbox/core/v2/common/PathRoot$Tag;->ROOT:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/common/PathRoot$Tag;
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/common/PathRoot;->_tag:Lcom/dropbox/core/v2/common/PathRoot$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 332
    sget-object v0, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/PathRoot$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 344
    sget-object v0, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/PathRoot$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/common/PathRoot$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
