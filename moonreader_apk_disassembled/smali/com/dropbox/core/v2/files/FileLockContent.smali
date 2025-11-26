.class public final Lcom/dropbox/core/v2/files/FileLockContent;
.super Ljava/lang/Object;
.source "FileLockContent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/FileLockContent$Serializer;,
        Lcom/dropbox/core/v2/files/FileLockContent$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/FileLockContent;

.field public static final UNLOCKED:Lcom/dropbox/core/v2/files/FileLockContent;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

.field private singleUserValue:Lcom/dropbox/core/v2/files/SingleUserLock;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 58
    new-instance v0, Lcom/dropbox/core/v2/files/FileLockContent;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/FileLockContent;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->UNLOCKED:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/FileLockContent;->withTag(Lcom/dropbox/core/v2/files/FileLockContent$Tag;)Lcom/dropbox/core/v2/files/FileLockContent;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/FileLockContent;->UNLOCKED:Lcom/dropbox/core/v2/files/FileLockContent;

    .line 66
    new-instance v0, Lcom/dropbox/core/v2/files/FileLockContent;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/FileLockContent;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->OTHER:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/FileLockContent;->withTag(Lcom/dropbox/core/v2/files/FileLockContent$Tag;)Lcom/dropbox/core/v2/files/FileLockContent;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/FileLockContent;->OTHER:Lcom/dropbox/core/v2/files/FileLockContent;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/FileLockContent;)Lcom/dropbox/core/v2/files/SingleUserLock;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/FileLockContent;->singleUserValue:Lcom/dropbox/core/v2/files/SingleUserLock;

    return-object p0
.end method

.method public static singleUser(Lcom/dropbox/core/v2/files/SingleUserLock;)Lcom/dropbox/core/v2/files/FileLockContent;
    .locals 2

    if-eqz p0, :cond_0

    .line 161
    new-instance v0, Lcom/dropbox/core/v2/files/FileLockContent;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/FileLockContent;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->SINGLE_USER:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/FileLockContent;->withTagAndSingleUser(Lcom/dropbox/core/v2/files/FileLockContent$Tag;Lcom/dropbox/core/v2/files/SingleUserLock;)Lcom/dropbox/core/v2/files/FileLockContent;

    move-result-object p0

    return-object p0

    .line 159
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/FileLockContent$Tag;)Lcom/dropbox/core/v2/files/FileLockContent;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/files/FileLockContent;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/FileLockContent;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    return-object v0
.end method

.method private withTagAndSingleUser(Lcom/dropbox/core/v2/files/FileLockContent$Tag;Lcom/dropbox/core/v2/files/SingleUserLock;)Lcom/dropbox/core/v2/files/FileLockContent;
    .locals 1

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/files/FileLockContent;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/FileLockContent;-><init>()V

    .line 99
    iput-object p1, v0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    .line 100
    iput-object p2, v0, Lcom/dropbox/core/v2/files/FileLockContent;->singleUserValue:Lcom/dropbox/core/v2/files/SingleUserLock;

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

    .line 209
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/FileLockContent;

    if-eqz v2, :cond_7

    .line 210
    check-cast p1, Lcom/dropbox/core/v2/files/FileLockContent;

    .line 211
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 214
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/FileLockContent$1;->$SwitchMap$com$dropbox$core$v2$files$FileLockContent$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 218
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileLockContent;->singleUserValue:Lcom/dropbox/core/v2/files/SingleUserLock;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/FileLockContent;->singleUserValue:Lcom/dropbox/core/v2/files/SingleUserLock;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/SingleUserLock;->equals(Ljava/lang/Object;)Z

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

.method public getSingleUserValue()Lcom/dropbox/core/v2/files/SingleUserLock;
    .locals 3

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->SINGLE_USER:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    if-ne v0, v1, :cond_0

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileLockContent;->singleUserValue:Lcom/dropbox/core/v2/files/SingleUserLock;

    return-object v0

    .line 176
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SINGLE_USER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 194
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/FileLockContent;->singleUserValue:Lcom/dropbox/core/v2/files/SingleUserLock;

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

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->OTHER:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSingleUser()Z
    .locals 2

    .line 141
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->SINGLE_USER:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnlocked()Z
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/FileLockContent$Tag;->UNLOCKED:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/FileLockContent$Tag;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/dropbox/core/v2/files/FileLockContent;->_tag:Lcom/dropbox/core/v2/files/FileLockContent$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 232
    sget-object v0, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileLockContent$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 244
    sget-object v0, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/FileLockContent$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/FileLockContent$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
