.class synthetic Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;
.super Ljava/lang/Object;
.source "AddSecondaryEmailResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 908
    invoke-static {}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->values()[Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNAVAILABLE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_PENDING:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_OWNED_BY_USER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->REACHED_LIMIT:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TOO_MANY_UPDATES:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    :try_start_8
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->RATE_LIMITED:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    :catch_8
    :try_start_9
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$AddSecondaryEmailResult$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    :catch_9
    return-void
.end method
