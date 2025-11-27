.class public final Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;
.super Ljava/lang/Object;
.source "SharingAllowlistRemoveError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;,
        Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;
    }
.end annotation


# static fields
.field public static final NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

.field public static final OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

.field public static final TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

.field public static final UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

.field private entriesDoNotExistValue:Ljava/lang/String;

.field private malformedEntryValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 70
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    .line 86
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->malformedEntryValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->entriesDoNotExistValue:Ljava/lang/String;

    return-object p0
.end method

.method public static entriesDoNotExist(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;
    .locals 2

    if-eqz p0, :cond_0

    .line 236
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->ENTRIES_DO_NOT_EXIST:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->withTagAndEntriesDoNotExist(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object p0

    return-object p0

    .line 234
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static malformedEntry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;
    .locals 2

    if-eqz p0, :cond_0

    .line 187
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->MALFORMED_ENTRY:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->withTagAndMalformedEntry(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    move-result-object p0

    return-object p0

    .line 185
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;
    .locals 1

    .line 104
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    .line 105
    iput-object p1, v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    return-object v0
.end method

.method private withTagAndEntriesDoNotExist(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;
    .locals 1

    .line 135
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    .line 136
    iput-object p1, v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    .line 137
    iput-object p2, v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->entriesDoNotExistValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndMalformedEntry(Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;-><init>()V

    .line 120
    iput-object p1, v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    .line 121
    iput-object p2, v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->malformedEntryValue:Ljava/lang/String;

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

    .line 320
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    if-eqz v2, :cond_7

    .line 321
    check-cast p1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;

    .line 322
    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 325
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$1;->$SwitchMap$com$dropbox$core$v2$team$SharingAllowlistRemoveError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 329
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->entriesDoNotExistValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->entriesDoNotExistValue:Ljava/lang/String;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 327
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->malformedEntryValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->malformedEntryValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    :cond_7
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getEntriesDoNotExistValue()Ljava/lang/String;
    .locals 3

    .line 252
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->ENTRIES_DO_NOT_EXIST:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-ne v0, v1, :cond_0

    .line 255
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->entriesDoNotExistValue:Ljava/lang/String;

    return-object v0

    .line 253
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ENTRIES_DO_NOT_EXIST, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMalformedEntryValue()Ljava/lang/String;
    .locals 3

    .line 202
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->MALFORMED_ENTRY:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-ne v0, v1, :cond_0

    .line 205
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->malformedEntryValue:Ljava/lang/String;

    return-object v0

    .line 203
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MALFORMED_ENTRY, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 304
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->malformedEntryValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->entriesDoNotExistValue:Ljava/lang/String;

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

.method public isEntriesDoNotExist()Z
    .locals 2

    .line 216
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->ENTRIES_DO_NOT_EXIST:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isMalformedEntry()Z
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->MALFORMED_ENTRY:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoEntriesProvided()Z
    .locals 2

    .line 266
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 299
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyEntriesProvided()Z
    .locals 2

    .line 277
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnknownError()Z
    .locals 2

    .line 288
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 349
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 361
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistRemoveError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
