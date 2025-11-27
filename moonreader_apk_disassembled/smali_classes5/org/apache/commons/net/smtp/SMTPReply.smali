.class public final Lorg/apache/commons/net/smtp/SMTPReply;
.super Ljava/lang/Object;
.source "SMTPReply.java"


# static fields
.field public static final ACTION_ABORTED:I = 0x1c3

.field public static final ACTION_NOT_TAKEN:I = 0x1c2

.field public static final ACTION_OK:I = 0xfa

.field public static final BAD_COMMAND_SEQUENCE:I = 0x1f7

.field public static final COMMAND_NOT_IMPLEMENTED:I = 0x1f6

.field public static final COMMAND_NOT_IMPLEMENTED_FOR_PARAMETER:I = 0x1f8

.field public static final HELP_MESSAGE:I = 0xd6

.field public static final INSUFFICIENT_STORAGE:I = 0x1c4

.field public static final MAILBOX_NAME_NOT_ALLOWED:I = 0x229

.field public static final MAILBOX_UNAVAILABLE:I = 0x226

.field public static final SERVICE_CLOSING_TRANSMISSION_CHANNEL:I = 0xdd

.field public static final SERVICE_NOT_AVAILABLE:I = 0x1a5

.field public static final SERVICE_READY:I = 0xdc

.field public static final START_MAIL_INPUT:I = 0x162

.field public static final STORAGE_ALLOCATION_EXCEEDED:I = 0x228

.field public static final SYNTAX_ERROR_IN_ARGUMENTS:I = 0x1f5

.field public static final SYSTEM_STATUS:I = 0xd3

.field public static final TRANSACTION_FAILED:I = 0x22a

.field public static final UNRECOGNIZED_COMMAND:I = 0x1f4

.field public static final USER_NOT_LOCAL:I = 0x227

.field public static final USER_NOT_LOCAL_WILL_FORWARD:I = 0xfb


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
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

.method public static isPositivePreliminary(I)Z
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
