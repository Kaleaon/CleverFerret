.class synthetic Lcom/dropbox/core/v2/team/TeamReportFailureReason$1;
.super Ljava/lang/Object;
.source "TeamReportFailureReason.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/TeamReportFailureReason;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$team$TeamReportFailureReason:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 53
    invoke-static {}, Lcom/dropbox/core/v2/team/TeamReportFailureReason;->values()[Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/team/TeamReportFailureReason$1;->$SwitchMap$com$dropbox$core$v2$team$TeamReportFailureReason:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/team/TeamReportFailureReason;->TEMPORARY_ERROR:Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/TeamReportFailureReason;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/team/TeamReportFailureReason$1;->$SwitchMap$com$dropbox$core$v2$team$TeamReportFailureReason:[I

    sget-object v1, Lcom/dropbox/core/v2/team/TeamReportFailureReason;->MANY_REPORTS_AT_ONCE:Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/TeamReportFailureReason;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/team/TeamReportFailureReason$1;->$SwitchMap$com$dropbox$core$v2$team$TeamReportFailureReason:[I

    sget-object v1, Lcom/dropbox/core/v2/team/TeamReportFailureReason;->TOO_MUCH_DATA:Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/TeamReportFailureReason;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
