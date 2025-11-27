.class public final Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
.super Ljava/lang/Object;
.source "SharingAllowlistAddError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;,
        Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;
    }
.end annotation


# static fields
.field public static final NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

.field public static final OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

.field public static final TEAM_LIMIT_REACHED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

.field public static final TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

.field public static final UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

.field private entriesAlreadyExistValue:Ljava/lang/String;

.field private malformedEntryValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->TEAM_LIMIT_REACHED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->TEAM_LIMIT_REACHED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    .line 86
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    .line 94
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->withTag(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/SharingAllowlistAddError;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->malformedEntryValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/SharingAllowlistAddError;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->entriesAlreadyExistValue:Ljava/lang/String;

    return-object p0
.end method

.method public static entriesAlreadyExist(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
    .locals 2

    if-eqz p0, :cond_0

    .line 288
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->ENTRIES_ALREADY_EXIST:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->withTagAndEntriesAlreadyExist(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object p0

    return-object p0

    .line 286
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static malformedEntry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
    .locals 2

    if-eqz p0, :cond_0

    .line 195
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->MALFORMED_ENTRY:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->withTagAndMalformedEntry(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    move-result-object p0

    return-object p0

    .line 193
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
    .locals 1

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    .line 113
    iput-object p1, v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    return-object v0
.end method

.method private withTagAndEntriesAlreadyExist(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
    .locals 1

    .line 143
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    .line 144
    iput-object p1, v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    .line 145
    iput-object p2, v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->entriesAlreadyExistValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndMalformedEntry(Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
    .locals 1

    .line 127
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;-><init>()V

    .line 128
    iput-object p1, v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    .line 129
    iput-object p2, v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->malformedEntryValue:Ljava/lang/String;

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

    .line 339
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    if-eqz v2, :cond_7

    .line 340
    check-cast p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;

    .line 341
    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 344
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$1;->$SwitchMap$com$dropbox$core$v2$team$SharingAllowlistAddError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 356
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->entriesAlreadyExistValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->entriesAlreadyExistValue:Ljava/lang/String;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    :pswitch_2
    return v0

    .line 346
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->malformedEntryValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->malformedEntryValue:Ljava/lang/String;

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
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getEntriesAlreadyExistValue()Ljava/lang/String;
    .locals 3

    .line 304
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->ENTRIES_ALREADY_EXIST:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    .line 307
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->entriesAlreadyExistValue:Ljava/lang/String;

    return-object v0

    .line 305
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ENTRIES_ALREADY_EXIST, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMalformedEntryValue()Ljava/lang/String;
    .locals 3

    .line 210
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->MALFORMED_ENTRY:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    .line 213
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->malformedEntryValue:Ljava/lang/String;

    return-object v0

    .line 211
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MALFORMED_ENTRY, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 323
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->malformedEntryValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->entriesAlreadyExistValue:Ljava/lang/String;

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

.method public isEntriesAlreadyExist()Z
    .locals 2

    .line 268
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->ENTRIES_ALREADY_EXIST:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isMalformedEntry()Z
    .locals 2

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->MALFORMED_ENTRY:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoEntriesProvided()Z
    .locals 2

    .line 224
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 318
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamLimitReached()Z
    .locals 2

    .line 246
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->TEAM_LIMIT_REACHED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyEntriesProvided()Z
    .locals 2

    .line 235
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnknownError()Z
    .locals 2

    .line 257
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError;->_tag:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 370
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 382
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
