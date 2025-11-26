.class public final Lcom/dropbox/core/v2/paper/ListUsersCursorError;
.super Ljava/lang/Object;
.source "ListUsersCursorError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;,
        Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;
    }
.end annotation


# static fields
.field public static final DOC_NOT_FOUND:Lcom/dropbox/core/v2/paper/ListUsersCursorError;

.field public static final INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/paper/ListUsersCursorError;

.field public static final OTHER:Lcom/dropbox/core/v2/paper/ListUsersCursorError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

.field private cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->withTag(Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;)Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    .line 71
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->OTHER:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->withTag(Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;)Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->OTHER:Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->DOC_NOT_FOUND:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->withTag(Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;)Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->DOC_NOT_FOUND:Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/paper/ListUsersCursorError;)Lcom/dropbox/core/v2/paper/PaperApiCursorError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    return-object p0
.end method

.method public static cursorError(Lcom/dropbox/core/v2/paper/PaperApiCursorError;)Lcom/dropbox/core/v2/paper/ListUsersCursorError;
    .locals 2

    if-eqz p0, :cond_0

    .line 188
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->CURSOR_ERROR:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->withTagAndCursorError(Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;Lcom/dropbox/core/v2/paper/PaperApiCursorError;)Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    move-result-object p0

    return-object p0

    .line 186
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;)Lcom/dropbox/core/v2/paper/ListUsersCursorError;
    .locals 1

    .line 92
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;-><init>()V

    .line 93
    iput-object p1, v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    return-object v0
.end method

.method private withTagAndCursorError(Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;Lcom/dropbox/core/v2/paper/PaperApiCursorError;)Lcom/dropbox/core/v2/paper/ListUsersCursorError;
    .locals 1

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListUsersCursorError;-><init>()V

    .line 107
    iput-object p1, v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    .line 108
    iput-object p2, v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

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

    .line 225
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    if-eqz v2, :cond_6

    .line 226
    check-cast p1, Lcom/dropbox/core/v2/paper/ListUsersCursorError;

    .line 227
    iget-object v2, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 230
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/paper/ListUsersCursorError$1;->$SwitchMap$com$dropbox$core$v2$paper$ListUsersCursorError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_5

    const/4 v3, 0x2

    if-eq v2, v3, :cond_5

    const/4 v3, 0x3

    if-eq v2, v3, :cond_5

    const/4 v3, 0x4

    if-eq v2, v3, :cond_3

    return v1

    .line 238
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    iget-object p1, p1, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getCursorErrorValue()Lcom/dropbox/core/v2/paper/PaperApiCursorError;
    .locals 3

    .line 201
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->CURSOR_ERROR:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    if-ne v0, v1, :cond_0

    .line 204
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    return-object v0

    .line 202
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.CURSOR_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 209
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 213
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isCursorError()Z
    .locals 2

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->CURSOR_ERROR:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDocNotFound()Z
    .locals 2

    .line 157
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->DOC_NOT_FOUND:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInsufficientPermissions()Z
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 146
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;->OTHER:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListUsersCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 250
    sget-object v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 262
    sget-object v0, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/paper/ListUsersCursorError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
