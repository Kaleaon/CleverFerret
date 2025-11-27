.class public final Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;
.super Ljava/lang/Object;
.source "RelocationBatchErrorEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Serializer;,
        Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;
    }
.end annotation


# static fields
.field public static final INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

.field public static final OTHER:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

.field public static final TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

.field private relocationErrorValue:Lcom/dropbox/core/v2/files/RelocationError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    .line 72
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;)Lcom/dropbox/core/v2/files/RelocationError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->relocationErrorValue:Lcom/dropbox/core/v2/files/RelocationError;

    return-object p0
.end method

.method public static relocationError(Lcom/dropbox/core/v2/files/RelocationError;)Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;
    .locals 2

    if-eqz p0, :cond_0

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->RELOCATION_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->withTagAndRelocationError(Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;Lcom/dropbox/core/v2/files/RelocationError;)Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    move-result-object p0

    return-object p0

    .line 162
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;
    .locals 1

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;-><init>()V

    .line 98
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    return-object v0
.end method

.method private withTagAndRelocationError(Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;Lcom/dropbox/core/v2/files/RelocationError;)Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;
    .locals 1

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;-><init>()V

    .line 113
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    .line 114
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->relocationErrorValue:Lcom/dropbox/core/v2/files/RelocationError;

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

    .line 235
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    if-eqz v2, :cond_7

    .line 236
    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    .line 237
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 240
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$1;->$SwitchMap$com$dropbox$core$v2$files$RelocationBatchErrorEntry$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 242
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->relocationErrorValue:Lcom/dropbox/core/v2/files/RelocationError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->relocationErrorValue:Lcom/dropbox/core/v2/files/RelocationError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/RelocationError;->equals(Ljava/lang/Object;)Z

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

.method public getRelocationErrorValue()Lcom/dropbox/core/v2/files/RelocationError;
    .locals 3

    .line 179
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->RELOCATION_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    if-ne v0, v1, :cond_0

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->relocationErrorValue:Lcom/dropbox/core/v2/files/RelocationError;

    return-object v0

    .line 180
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.RELOCATION_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 220
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->relocationErrorValue:Lcom/dropbox/core/v2/files/RelocationError;

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

.method public isInternalError()Z
    .locals 2

    .line 193
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 215
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRelocationError()Z
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->RELOCATION_ERROR:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyWriteOperations()Z
    .locals 2

    .line 204
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 260
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 272
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
