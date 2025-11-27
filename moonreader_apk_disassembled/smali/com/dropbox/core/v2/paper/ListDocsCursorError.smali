.class public final Lcom/dropbox/core/v2/paper/ListDocsCursorError;
.super Ljava/lang/Object;
.source "ListDocsCursorError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;,
        Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/paper/ListDocsCursorError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

.field private cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 55
    new-instance v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListDocsCursorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;->OTHER:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->withTag(Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;)Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->OTHER:Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/paper/ListDocsCursorError;)Lcom/dropbox/core/v2/paper/PaperApiCursorError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    return-object p0
.end method

.method public static cursorError(Lcom/dropbox/core/v2/paper/PaperApiCursorError;)Lcom/dropbox/core/v2/paper/ListDocsCursorError;
    .locals 2

    if-eqz p0, :cond_0

    .line 138
    new-instance v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListDocsCursorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;->CURSOR_ERROR:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->withTagAndCursorError(Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;Lcom/dropbox/core/v2/paper/PaperApiCursorError;)Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    move-result-object p0

    return-object p0

    .line 136
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;)Lcom/dropbox/core/v2/paper/ListDocsCursorError;
    .locals 1

    .line 72
    new-instance v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListDocsCursorError;-><init>()V

    .line 73
    iput-object p1, v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    return-object v0
.end method

.method private withTagAndCursorError(Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;Lcom/dropbox/core/v2/paper/PaperApiCursorError;)Lcom/dropbox/core/v2/paper/ListDocsCursorError;
    .locals 1

    .line 86
    new-instance v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/paper/ListDocsCursorError;-><init>()V

    .line 87
    iput-object p1, v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    .line 88
    iput-object p2, v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

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

    .line 185
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    if-eqz v2, :cond_7

    .line 186
    check-cast p1, Lcom/dropbox/core/v2/paper/ListDocsCursorError;

    .line 187
    iget-object v2, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 190
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/paper/ListDocsCursorError$1;->$SwitchMap$com$dropbox$core$v2$paper$ListDocsCursorError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 192
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    iget-object p1, p1, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->equals(Ljava/lang/Object;)Z

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

.method public getCursorErrorValue()Lcom/dropbox/core/v2/paper/PaperApiCursorError;
    .locals 3

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;->CURSOR_ERROR:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    if-ne v0, v1, :cond_0

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    return-object v0

    .line 152
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.CURSOR_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 170
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->cursorErrorValue:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

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

.method public isCursorError()Z
    .locals 2

    .line 118
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;->CURSOR_ERROR:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 165
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;->OTHER:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/ListDocsCursorError;->_tag:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 206
    sget-object v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 218
    sget-object v0, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/paper/ListDocsCursorError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
