.class synthetic Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;
.super Ljava/lang/Object;
.source "LegalHoldsPolicyUpdateError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 80
    invoke-static {}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->values()[Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->UNKNOWN_LEGAL_HOLD_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->OTHER:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INACTIVE_LEGAL_HOLD:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->LEGAL_HOLD_PERFORMING_ANOTHER_OPERATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INVALID_MEMBERS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->NUMBER_OF_USERS_ON_HOLD_IS_GREATER_THAN_HOLD_LIMITATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    :try_start_8
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->EMPTY_MEMBERS_LIST:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    :catch_8
    :try_start_9
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->NAME_MUST_BE_UNIQUE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    :catch_9
    :try_start_a
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyUpdateError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->LEGAL_HOLD_POLICY_NOT_FOUND:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    :catch_a
    return-void
.end method
