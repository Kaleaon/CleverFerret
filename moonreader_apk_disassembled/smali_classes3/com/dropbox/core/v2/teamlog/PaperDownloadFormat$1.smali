.class synthetic Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat$1;
.super Ljava/lang/Object;
.source "PaperDownloadFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$teamlog$PaperDownloadFormat:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 42
    invoke-static {}, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->values()[Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat$1;->$SwitchMap$com$dropbox$core$v2$teamlog$PaperDownloadFormat:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->DOCX:Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat$1;->$SwitchMap$com$dropbox$core$v2$teamlog$PaperDownloadFormat:[I

    sget-object v1, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->HTML:Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat$1;->$SwitchMap$com$dropbox$core$v2$teamlog$PaperDownloadFormat:[I

    sget-object v1, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->MARKDOWN:Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat$1;->$SwitchMap$com$dropbox$core$v2$teamlog$PaperDownloadFormat:[I

    sget-object v1, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->PDF:Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/teamlog/PaperDownloadFormat;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method
