.class public final Lorg/apache/commons/net/nntp/NNTPReply;
.super Ljava/lang/Object;
.source "NNTPReply.java"


# static fields
.field public static final ARTICLE_LIST_BY_MESSAGE_ID_FOLLOWS:I = 0xe6

.field public static final ARTICLE_NOT_WANTED:I = 0x1b3

.field public static final ARTICLE_POSTED_OK:I = 0xf0

.field public static final ARTICLE_REJECTED:I = 0x1b5

.field public static final ARTICLE_RETRIEVED_BODY_FOLLOWS:I = 0xde

.field public static final ARTICLE_RETRIEVED_HEAD_AND_BODY_FOLLOW:I = 0xdc

.field public static final ARTICLE_RETRIEVED_HEAD_FOLLOWS:I = 0xdd

.field public static final ARTICLE_RETRIEVED_REQUEST_TEXT_SEPARATELY:I = 0xdf

.field public static final ARTICLE_TRANSFERRED_OK:I = 0xeb

.field public static final AUTHENTICATION_ACCEPTED:I = 0x119

.field public static final AUTHENTICATION_REJECTED:I = 0x1e2

.field public static final AUTHENTICATION_REQUIRED:I = 0x1e0

.field public static final CLOSING_CONNECTION:I = 0xcd

.field public static final COMMAND_NOT_RECOGNIZED:I = 0x1f4

.field public static final COMMAND_SYNTAX_ERROR:I = 0x1f5

.field public static final DEBUG_OUTPUT:I = 0xc7

.field public static final GROUP_SELECTED:I = 0xd3

.field public static final HELP_TEXT_FOLLOWS:I = 0x64

.field public static final MORE_AUTH_INFO_REQUIRED:I = 0x17d

.field public static final NEW_NEWSGROUP_LIST_FOLLOWS:I = 0xe7

.field public static final NO_CURRENT_ARTICLE_SELECTED:I = 0x1a4

.field public static final NO_NEWSGROUP_SELECTED:I = 0x19c

.field public static final NO_NEXT_ARTICLE:I = 0x1a5

.field public static final NO_PREVIOUS_ARTICLE:I = 0x1a6

.field public static final NO_SUCH_ARTICLE_FOUND:I = 0x1ae

.field public static final NO_SUCH_ARTICLE_NUMBER:I = 0x1a7

.field public static final NO_SUCH_NEWSGROUP:I = 0x19b

.field public static final PERMISSION_DENIED:I = 0x1f6

.field public static final POSTING_FAILED:I = 0x1b9

.field public static final POSTING_NOT_ALLOWED:I = 0x1b8

.field public static final PROGRAM_FAULT:I = 0x1f7

.field public static final SEND_ARTICLE_TO_POST:I = 0x154

.field public static final SEND_ARTICLE_TO_TRANSFER:I = 0x14f

.field public static final SERVER_READY_POSTING_ALLOWED:I = 0xc8

.field public static final SERVER_READY_POSTING_NOT_ALLOWED:I = 0xc9

.field public static final SERVICE_DISCONTINUED:I = 0x190

.field public static final SLAVE_STATUS_NOTED:I = 0xca

.field public static final TRANSFER_FAILED:I = 0x1b4


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isInformational(I)Z
    .locals 1

    const/16 v0, 0x64

    if-lt p0, v0, :cond_0

    const/16 v0, 0xc8

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isNegativePermanent(I)Z
    .locals 1

    const/16 v0, 0x1f4

    if-lt p0, v0, :cond_0

    const/16 v0, 0x258

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isNegativeTransient(I)Z
    .locals 1

    const/16 v0, 0x190

    if-lt p0, v0, :cond_0

    const/16 v0, 0x1f4

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isPositiveCompletion(I)Z
    .locals 1

    const/16 v0, 0xc8

    if-lt p0, v0, :cond_0

    const/16 v0, 0x12c

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isPositiveIntermediate(I)Z
    .locals 1

    const/16 v0, 0x12c

    if-lt p0, v0, :cond_0

    const/16 v0, 0x190

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
