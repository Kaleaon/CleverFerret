.class public final Lcom/dropbox/core/v2/sharing/GetSharedLinksError;
.super Ljava/lang/Object;
.source "GetSharedLinksError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Serializer;,
        Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/sharing/GetSharedLinksError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

.field private pathValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 55
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->withTag(Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;)Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->OTHER:Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/GetSharedLinksError;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->pathValue:Ljava/lang/String;

    return-object p0
.end method

.method public static path()Lcom/dropbox/core/v2/sharing/GetSharedLinksError;
    .locals 1

    const/4 v0, 0x0

    .line 142
    invoke-static {v0}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->path(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    move-result-object v0

    return-object v0
.end method

.method public static path(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinksError;
    .locals 2

    .line 129
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;->PATH:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->withTagAndPath(Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    move-result-object p0

    return-object p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;)Lcom/dropbox/core/v2/sharing/GetSharedLinksError;
    .locals 1

    .line 72
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;-><init>()V

    .line 73
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinksError;
    .locals 1

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;-><init>()V

    .line 83
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    .line 84
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->pathValue:Ljava/lang/String;

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

    .line 188
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    if-eqz v2, :cond_7

    .line 189
    check-cast p1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;

    .line 190
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 193
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$1;->$SwitchMap$com$dropbox$core$v2$sharing$GetSharedLinksError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 195
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->pathValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->pathValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

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

.method public getPathValue()Ljava/lang/String;
    .locals 3

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;->PATH:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    if-ne v0, v1, :cond_0

    .line 157
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->pathValue:Ljava/lang/String;

    return-object v0

    .line 155
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->pathValue:Ljava/lang/String;

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

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;->PATH:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError;->_tag:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 209
    sget-object v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 221
    sget-object v0, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/GetSharedLinksError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
