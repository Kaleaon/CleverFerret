.class public final Lcom/dropbox/core/v2/files/SaveCopyReferenceError;
.super Ljava/lang/Object;
.source "SaveCopyReferenceError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;,
        Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;
    }
.end annotation


# static fields
.field public static final INVALID_COPY_REFERENCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

.field public static final NOT_FOUND:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

.field public static final TOO_MANY_FILES:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/WriteError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->INVALID_COPY_REFERENCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->withTag(Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->INVALID_COPY_REFERENCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->withTag(Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->NO_PERMISSION:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->withTag(Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->NOT_FOUND:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->withTag(Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    .line 91
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->OTHER:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->withTag(Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->OTHER:Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/SaveCopyReferenceError;)Lcom/dropbox/core/v2/files/WriteError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;
    .locals 2

    if-eqz p0, :cond_0

    .line 174
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->PATH:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->withTagAndPath(Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    move-result-object p0

    return-object p0

    .line 172
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;
    .locals 1

    .line 108
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;-><init>()V

    .line 109
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/SaveCopyReferenceError;
    .locals 1

    .line 122
    new-instance v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;-><init>()V

    .line 123
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    .line 124
    iput-object p2, v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

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

    .line 264
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    if-eqz v2, :cond_5

    .line 265
    check-cast p1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;

    .line 266
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 269
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$1;->$SwitchMap$com$dropbox$core$v2$files$SaveCopyReferenceError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 271
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/WriteError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/WriteError;
    .locals 3

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->PATH:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    if-ne v0, v1, :cond_0

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0

    .line 187
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 249
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

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

.method public isInvalidCopyReference()Z
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->INVALID_COPY_REFERENCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotFound()Z
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->OTHER:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->PATH:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyFiles()Z
    .locals 2

    .line 233
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError;->_tag:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 293
    sget-object v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 305
    sget-object v0, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SaveCopyReferenceError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
