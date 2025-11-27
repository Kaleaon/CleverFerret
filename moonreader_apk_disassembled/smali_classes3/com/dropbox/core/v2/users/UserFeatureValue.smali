.class public final Lcom/dropbox/core/v2/users/UserFeatureValue;
.super Ljava/lang/Object;
.source "UserFeatureValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;,
        Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/users/UserFeatureValue;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

.field private fileLockingValue:Lcom/dropbox/core/v2/users/FileLockingValue;

.field private paperAsFilesValue:Lcom/dropbox/core/v2/users/PaperAsFilesValue;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 58
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->OTHER:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/users/UserFeatureValue;->withTag(Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;)Lcom/dropbox/core/v2/users/UserFeatureValue;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/users/UserFeatureValue;->OTHER:Lcom/dropbox/core/v2/users/UserFeatureValue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/users/UserFeatureValue;)Lcom/dropbox/core/v2/users/PaperAsFilesValue;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->paperAsFilesValue:Lcom/dropbox/core/v2/users/PaperAsFilesValue;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/users/UserFeatureValue;)Lcom/dropbox/core/v2/users/FileLockingValue;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->fileLockingValue:Lcom/dropbox/core/v2/users/FileLockingValue;

    return-object p0
.end method

.method public static fileLocking(Lcom/dropbox/core/v2/users/FileLockingValue;)Lcom/dropbox/core/v2/users/UserFeatureValue;
    .locals 2

    if-eqz p0, :cond_0

    .line 207
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->FILE_LOCKING:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/users/UserFeatureValue;->withTagAndFileLocking(Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;Lcom/dropbox/core/v2/users/FileLockingValue;)Lcom/dropbox/core/v2/users/UserFeatureValue;

    move-result-object p0

    return-object p0

    .line 205
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static paperAsFiles(Lcom/dropbox/core/v2/users/PaperAsFilesValue;)Lcom/dropbox/core/v2/users/UserFeatureValue;
    .locals 2

    if-eqz p0, :cond_0

    .line 160
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->PAPER_AS_FILES:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/users/UserFeatureValue;->withTagAndPaperAsFiles(Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;Lcom/dropbox/core/v2/users/PaperAsFilesValue;)Lcom/dropbox/core/v2/users/UserFeatureValue;

    move-result-object p0

    return-object p0

    .line 158
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;)Lcom/dropbox/core/v2/users/UserFeatureValue;
    .locals 1

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue;-><init>()V

    .line 78
    iput-object p1, v0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    return-object v0
.end method

.method private withTagAndFileLocking(Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;Lcom/dropbox/core/v2/users/FileLockingValue;)Lcom/dropbox/core/v2/users/UserFeatureValue;
    .locals 1

    .line 108
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue;-><init>()V

    .line 109
    iput-object p1, v0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    .line 110
    iput-object p2, v0, Lcom/dropbox/core/v2/users/UserFeatureValue;->fileLockingValue:Lcom/dropbox/core/v2/users/FileLockingValue;

    return-object v0
.end method

.method private withTagAndPaperAsFiles(Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;Lcom/dropbox/core/v2/users/PaperAsFilesValue;)Lcom/dropbox/core/v2/users/UserFeatureValue;
    .locals 1

    .line 92
    new-instance v0, Lcom/dropbox/core/v2/users/UserFeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/UserFeatureValue;-><init>()V

    .line 93
    iput-object p1, v0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    .line 94
    iput-object p2, v0, Lcom/dropbox/core/v2/users/UserFeatureValue;->paperAsFilesValue:Lcom/dropbox/core/v2/users/PaperAsFilesValue;

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

    .line 255
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/users/UserFeatureValue;

    if-eqz v2, :cond_a

    .line 256
    check-cast p1, Lcom/dropbox/core/v2/users/UserFeatureValue;

    .line 257
    iget-object v2, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 260
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/users/UserFeatureValue$1;->$SwitchMap$com$dropbox$core$v2$users$UserFeatureValue$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->ordinal()I

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

    .line 264
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->fileLockingValue:Lcom/dropbox/core/v2/users/FileLockingValue;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/UserFeatureValue;->fileLockingValue:Lcom/dropbox/core/v2/users/FileLockingValue;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/users/FileLockingValue;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 262
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->paperAsFilesValue:Lcom/dropbox/core/v2/users/PaperAsFilesValue;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/UserFeatureValue;->paperAsFilesValue:Lcom/dropbox/core/v2/users/PaperAsFilesValue;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/users/PaperAsFilesValue;->equals(Ljava/lang/Object;)Z

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

.method public getFileLockingValue()Lcom/dropbox/core/v2/users/FileLockingValue;
    .locals 3

    .line 220
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->FILE_LOCKING:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    if-ne v0, v1, :cond_0

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->fileLockingValue:Lcom/dropbox/core/v2/users/FileLockingValue;

    return-object v0

    .line 221
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FILE_LOCKING, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPaperAsFilesValue()Lcom/dropbox/core/v2/users/PaperAsFilesValue;
    .locals 3

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->PAPER_AS_FILES:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    if-ne v0, v1, :cond_0

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->paperAsFilesValue:Lcom/dropbox/core/v2/users/PaperAsFilesValue;

    return-object v0

    .line 174
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PAPER_AS_FILES, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 239
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->paperAsFilesValue:Lcom/dropbox/core/v2/users/PaperAsFilesValue;

    iget-object v2, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->fileLockingValue:Lcom/dropbox/core/v2/users/FileLockingValue;

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

.method public isFileLocking()Z
    .locals 2

    .line 187
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->FILE_LOCKING:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->OTHER:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPaperAsFiles()Z
    .locals 2

    .line 140
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;->PAPER_AS_FILES:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/dropbox/core/v2/users/UserFeatureValue;->_tag:Lcom/dropbox/core/v2/users/UserFeatureValue$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 278
    sget-object v0, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 290
    sget-object v0, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/UserFeatureValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
