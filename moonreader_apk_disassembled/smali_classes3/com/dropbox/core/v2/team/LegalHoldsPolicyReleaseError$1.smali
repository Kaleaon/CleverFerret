.class synthetic Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$1;
.super Ljava/lang/Object;
.source "LegalHoldsPolicyReleaseError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyReleaseError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 59
    invoke-static {}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->values()[Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyReleaseError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->UNKNOWN_LEGAL_HOLD_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyReleaseError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyReleaseError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->OTHER:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyReleaseError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->LEGAL_HOLD_PERFORMING_ANOTHER_OPERATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyReleaseError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->LEGAL_HOLD_ALREADY_RELEASING:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError$1;->$SwitchMap$com$dropbox$core$v2$team$LegalHoldsPolicyReleaseError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->LEGAL_HOLD_POLICY_NOT_FOUND:Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyReleaseError;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    return-void
.end method
