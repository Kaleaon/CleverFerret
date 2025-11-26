.class public Lcom/flyersoft/moonreaderp/PrefMisc;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;
    }
.end annotation


# static fields
.field static filterLay:Landroid/widget/LinearLayout;

.field public static onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private static progressDlg:Landroid/app/ProgressDialog;

.field private static repalcesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$Filter_Item;",
            ">;"
        }
    .end annotation
.end field

.field static replaceForAllBook:Z

.field static replaceLay:Landroid/widget/LinearLayout;

.field public static selectedBackup:Ljava/lang/String;

.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

.field public static syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field public static syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field public static syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field public static syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field private static tmpBooksSize:J

.field private static tmpCoversSize:J


# instance fields
.field appOptionsB:Landroid/widget/TextView;

.field autoScrollB:Landroid/widget/TextView;

.field b1:Landroid/widget/Button;

.field b2:Landroid/widget/Button;

.field backupB:Landroid/widget/Button;

.field bottomBarTv:Landroid/widget/TextView;

.field debugTv:Landroid/widget/TextView;

.field dictTv:Landroid/widget/TextView;

.field fb2Tv:Landroid/widget/TextView;

.field public fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field imageTv:Landroid/widget/TextView;

.field indentTipped:Z

.field linkTv:Landroid/widget/TextView;

.field nameReplace:Landroid/widget/TextView;

.field noteTv:Landroid/widget/TextView;

.field pageSoundDlg:Lcom/flyersoft/components/MyDialog;

.field restoreB:Landroid/widget/Button;

.field speakMoreButton:Landroid/view/View;


# direct methods
.method static bridge synthetic -$$Nest$mdo_SetCSS(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->do_SetCSS()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msaveOptions(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->saveOptions()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetPageSound(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->setPageSound()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetprogressDlg()Landroid/app/ProgressDialog;
    .locals 1

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->progressDlg:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetrepalcesList()Ljava/util/ArrayList;
    .locals 1

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgettmpBooksSize()J
    .locals 2

    sget-wide v0, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgettmpCoversSize()J
    .locals 2

    sget-wide v0, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfputrepalcesList(Ljava/util/ArrayList;)V
    .locals 0

    sput-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputtmpBooksSize(J)V
    .locals 0

    sput-wide p0, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputtmpCoversSize(J)V
    .locals 0

    sput-wide p0, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    return-void
.end method

.method static bridge synthetic -$$Nest$smSDK23()Z
    .locals 1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->SDK23()Z

    move-result v0

    return v0
.end method

.method static bridge synthetic -$$Nest$smaddNewReplaceItem(Ljava/lang/String;Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefMisc;->addNewReplaceItem(Ljava/lang/String;Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smbackupFilenameByToday()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->backupFilenameByToday()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smbackupProc(Landroid/app/Dialog;I)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->backupProc(Landroid/app/Dialog;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smcheckIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->checkIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smcloudTmpBackupFilename()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->cloudTmpBackupFilename()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smdismissDlg()V
    .locals 0

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->dismissDlg()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdoAfterRestoreFailed(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->doAfterRestoreFailed(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdoAfterRestoreSuccess(Landroid/content/Context;)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->doAfterRestoreSuccess(Landroid/content/Context;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smgetAllBookCoversSize()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->getAllBookCoversSize()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smgetAllBookFilesSize()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->getAllBookFilesSize()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smloadReplacesToView(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->loadReplacesToView(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$smloadTtsFilterToView(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->loadTtsFilterToView(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smregularExpressionTip(Landroid/content/Context;)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->regularExpressionTip(Landroid/content/Context;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smrestoreProc(Landroid/app/Dialog;I)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc(Landroid/app/Dialog;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smrestoreProc_second(Landroid/app/Dialog;ILjava/util/ArrayList;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_second(Landroid/app/Dialog;ILjava/util/ArrayList;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smshowBackupSuccessInfo(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->showBackupSuccessInfo(Ljava/lang/String;Landroid/content/Context;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smuploadBackupFileToCloud(ILjava/lang/String;Ljava/lang/String;Landroid/os/Handler;Landroid/content/Context;)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/flyersoft/moonreaderp/PrefMisc;->uploadBackupFileToCloud(ILjava/lang/String;Ljava/lang/String;Landroid/os/Handler;Landroid/content/Context;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 3162
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$117;

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefMisc$117;-><init>()V

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 93
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->pref_misc:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x0

    .line 360
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->indentTipped:Z

    .line 94
    invoke-virtual {p0, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->scrollToTitle(Ljava/lang/String;)V

    return-void
.end method

.method private static SDK23()Z
    .locals 2

    .line 3459
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private static addNewReplaceItem(Ljava/lang/String;Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V
    .locals 3

    .line 2143
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/tools/A$Filter_Item;

    const-string v2, ""

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2144
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2145
    invoke-static {p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefMisc;->setReplaceItemProperties(Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V

    .line 2146
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2147
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/EditText;

    .line 2148
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<b>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "</b>"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2150
    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p3, Lcom/flyersoft/moonreaderp/R$layout;->tts_filter:I

    const/4 v0, 0x0

    invoke-virtual {p0, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    .line 2151
    sget-object p3, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2152
    invoke-static {p1, p2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->setReplaceItemProperties(Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V

    .line 2153
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    const/4 p2, -0x1

    const/4 p3, -0x2

    invoke-virtual {p1, p0, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 2154
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 2155
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->scrollToBottom(Landroid/view/View;)V

    return-void
.end method

.method private static backupFilenameByToday()Ljava/lang/String;
    .locals 3

    .line 2988
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, ""

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 2989
    const-string v1, "yyyy-MM-dd"

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    .line 2990
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static backupProc(Landroid/app/Dialog;I)V
    .locals 19

    move/from16 v7, p1

    const/16 v0, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x4

    if-nez v7, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    if-ne v7, v2, :cond_1

    goto :goto_0

    :cond_1
    if-ne v7, v4, :cond_2

    const/4 v4, 0x4

    goto :goto_0

    :cond_2
    const/4 v4, 0x3

    if-ne v7, v4, :cond_3

    const/4 v4, 0x6

    goto :goto_0

    :cond_3
    const/16 v4, 0x8

    :goto_0
    if-nez v7, :cond_4

    .line 2807
    sget-object v5, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    goto :goto_1

    :cond_4
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->getBackupMethods()[Ljava/lang/CharSequence;

    move-result-object v5

    aget-object v5, v5, v7

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2808
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v8

    sget v9, Lcom/flyersoft/moonreaderp/R$string;->backup_to:I

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ""

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2810
    invoke-virtual/range {p0 .. p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v12

    .line 2811
    invoke-static {v12}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    sget v9, Lcom/flyersoft/moonreaderp/R$layout;->backup_saveto:I

    const/4 v15, 0x0

    invoke-virtual {v8, v9, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    .line 2812
    sget v8, Lcom/flyersoft/moonreaderp/R$id;->folderET:I

    invoke-virtual {v10, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 2813
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->covers:I

    invoke-virtual {v10, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    move-object v14, v9

    check-cast v14, Landroid/widget/CheckBox;

    .line 2814
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->books:I

    invoke-virtual {v10, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    move-object v11, v9

    check-cast v11, Landroid/widget/CheckBox;

    .line 2815
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->autobackup:I

    invoke-virtual {v10, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/CheckBox;

    .line 2816
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {v10, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    const/16 v16, 0x1

    .line 2818
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->progressBar1:I

    invoke-virtual {v10, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    .line 2819
    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 2820
    sget v15, Lcom/flyersoft/moonreaderp/R$id;->progressBar2:I

    invoke-virtual {v10, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/ProgressBar;

    .line 2821
    invoke-virtual {v15, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 2822
    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2823
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->title:I

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-wide/16 v17, 0x0

    .line 2824
    sput-wide v17, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    sput-wide v17, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    .line 2826
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->day_week_month_year:I

    invoke-virtual {v12, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2827
    const-string v6, "/"

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    if-eq v1, v3, :cond_5

    .line 2828
    const-string v0, "Day/Week/Month/Year"

    .line 2829
    :cond_5
    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 2831
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->auto_backup:I

    invoke-virtual {v12, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2832
    sget v3, Lcom/flyersoft/tools/A;->autobackupCloud:I

    const-string v6, " | "

    if-lez v3, :cond_6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v5, Lcom/flyersoft/tools/A;->autobackupCloud:I

    invoke-static {v5}, Lcom/flyersoft/components/cloud/Cloud;->getCloudName(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :cond_6
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/flyersoft/tools/A;->autobackupType:I

    aget-object v3, v0, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2831
    invoke-virtual {v9, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    if-nez v4, :cond_7

    .line 2833
    sget-boolean v1, Lcom/flyersoft/tools/A;->autobackupLocal:Z

    goto :goto_2

    :cond_7
    sget v1, Lcom/flyersoft/tools/A;->autobackupCloud:I

    if-ne v4, v1, :cond_8

    const/4 v1, 0x1

    goto :goto_2

    :cond_8
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v9, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 2834
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$104;

    invoke-direct {v1, v4, v9, v12, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$104;-><init>(ILandroid/widget/CheckBox;Landroid/content/Context;[Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 2852
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->autoBackupOption:I

    invoke-virtual {v10, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$105;

    invoke-direct {v3, v0, v12, v9}, Lcom/flyersoft/moonreaderp/PrefMisc$105;-><init>([Ljava/lang/String;Landroid/content/Context;Landroid/widget/CheckBox;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v3, v8

    .line 2869
    new-instance v8, Lcom/flyersoft/moonreaderp/PrefMisc$106;

    move-object v9, v14

    move-object v14, v11

    move-object v11, v9

    move-object v9, v2

    invoke-direct/range {v8 .. v14}, Lcom/flyersoft/moonreaderp/PrefMisc$106;-><init>(Landroid/widget/ProgressBar;Landroid/view/View;Landroid/widget/CheckBox;Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/CheckBox;)V

    move-object v2, v14

    move-object v14, v11

    invoke-virtual {v14, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 2893
    new-instance v8, Lcom/flyersoft/moonreaderp/PrefMisc$107;

    move-object v11, v2

    move-object v9, v15

    invoke-direct/range {v8 .. v14}, Lcom/flyersoft/moonreaderp/PrefMisc$107;-><init>(Landroid/widget/ProgressBar;Landroid/view/View;Landroid/widget/CheckBox;Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/CheckBox;)V

    invoke-virtual {v2, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 2917
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$108;

    invoke-direct {v0, v3}, Lcom/flyersoft/moonreaderp/PrefMisc$108;-><init>(Landroid/widget/EditText;)V

    const-wide/16 v5, 0x64

    invoke-virtual {v3, v0, v5, v6}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2924
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->backupFilenameByToday()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2925
    invoke-virtual/range {p0 .. p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->Folders:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2926
    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 2927
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v5, 0x0

    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_9
    move-object v8, v0

    .line 2929
    new-instance v9, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v9, v12}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 2930
    invoke-virtual {v9, v10}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v10

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$109;

    move-object/from16 v6, p0

    move-object v5, v12

    move-object v1, v14

    invoke-direct/range {v0 .. v7}, Lcom/flyersoft/moonreaderp/PrefMisc$109;-><init>(Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;ILandroid/content/Context;Landroid/app/Dialog;I)V

    const v1, 0x104000a

    .line 2931
    invoke-virtual {v10, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 2960
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    if-nez v4, :cond_a

    .line 2963
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$110;

    move-object/from16 v6, p0

    invoke-direct {v0, v6}, Lcom/flyersoft/moonreaderp/PrefMisc$110;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v9, v8, v0}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 2984
    :cond_a
    invoke-virtual {v9}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static backupToCloud(ZZLjava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V
    .locals 9

    .line 3004
    sget p5, Lcom/flyersoft/moonreaderp/R$string;->backup:I

    invoke-virtual {p4, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p5

    const/4 v0, 0x0

    invoke-static {p4, p5, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->createProgressDlg(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 3005
    new-instance v5, Lcom/flyersoft/moonreaderp/PrefMisc$111;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p5

    invoke-direct {v5, p5, p3, p4}, Lcom/flyersoft/moonreaderp/PrefMisc$111;-><init>(Landroid/os/Looper;Ljava/lang/String;Landroid/content/Context;)V

    .line 3022
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$112;

    move v3, p0

    move v4, p1

    move-object v7, p2

    move-object v2, p3

    move-object v8, p4

    move v6, p6

    invoke-direct/range {v1 .. v8}, Lcom/flyersoft/moonreaderp/PrefMisc$112;-><init>(Ljava/lang/String;ZZLandroid/os/Handler;ILjava/lang/String;Landroid/content/Context;)V

    .line 3034
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc$112;->start()V

    return-void
.end method

.method public static backupToLocal(ZZLjava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V
    .locals 8

    .line 3050
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->backup:I

    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p3, v0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->createProgressDlg(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 3051
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$114;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move v7, p5

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefMisc$114;-><init>(Landroid/os/Looper;Ljava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V

    .line 3082
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefMisc$115;

    invoke-direct {p2, v4, p0, p1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$115;-><init>(Ljava/lang/String;ZZLandroid/os/Handler;)V

    .line 3093
    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefMisc$115;->start()V

    return-void
.end method

.method private static checkIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V
    .locals 3

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_0

    .line 2162
    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->phSearch:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SearchView;

    if-nez v0, :cond_1

    goto :goto_0

    .line 2165
    :cond_1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x6

    if-ge v1, v2, :cond_2

    const/16 p0, 0x8

    .line 2166
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/SearchView;->setVisibility(I)V

    return-void

    :cond_2
    const/4 v1, 0x0

    .line 2169
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setVisibility(I)V

    .line 2170
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->getTag()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x1

    .line 2172
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SearchView;->setTag(Ljava/lang/Object;)V

    .line 2174
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$85;

    invoke-direct {v2, p0, v0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$85;-><init>(Landroid/view/View;Landroidx/appcompat/widget/SearchView;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    .line 2185
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$86;

    invoke-direct {v2, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$86;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$OnCloseListener;)V

    .line 2191
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$87;

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$87;-><init>(Landroid/view/View;Landroidx/appcompat/widget/SearchView;)V

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    const p0, -0x777778

    .line 2197
    invoke-static {v0, p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->setImageViewTint(Landroid/view/View;I)V

    .line 2198
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setSubmitButtonEnabled(Z)V

    :cond_4
    :goto_0
    return-void
.end method

.method private static cloudTmpBackupFilename()Ljava/lang/String;
    .locals 2

    .line 3159
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/cloud.backup"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static createNamesReplacementView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
    .locals 8

    .line 1867
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->pref_edit_replacement:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 1869
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->oneSite:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/RoundButton;

    .line 1870
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->allSite:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/RoundButton;

    const/4 v3, 0x0

    .line 1871
    sput-boolean v3, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceForAllBook:Z

    const/4 v4, 0x1

    .line 1872
    invoke-virtual {v1, v4}, Lcom/flyersoft/views/RoundButton;->setChecked(Z)V

    .line 1873
    invoke-virtual {v2, v3}, Lcom/flyersoft/views/RoundButton;->setChecked(Z)V

    .line 1875
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$73;

    invoke-direct {v3, v2, v1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$73;-><init>(Lcom/flyersoft/views/RoundButton;Lcom/flyersoft/views/RoundButton;Landroid/content/Context;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v3}, Lcom/flyersoft/views/RoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1889
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$74;

    invoke-direct {v3, v1, v2, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$74;-><init>(Lcom/flyersoft/views/RoundButton;Lcom/flyersoft/views/RoundButton;Landroid/content/Context;Landroid/widget/LinearLayout;)V

    invoke-virtual {v2, v3}, Lcom/flyersoft/views/RoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1904
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->replaceLay:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    sput-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    .line 1905
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->use_reglaur:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 1906
    sget-boolean v3, Lcom/flyersoft/tools/A;->names_replace_with_regular_expression:Z

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1907
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$75;

    invoke-direct {v3}, Lcom/flyersoft/moonreaderp/PrefMisc$75;-><init>()V

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1912
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->in_menu:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 1913
    sget-boolean v3, Lcom/flyersoft/tools/A;->replacement_in_main_menu:Z

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1914
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$76;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$76;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1922
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$77;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$77;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1929
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->importTv:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 1930
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->exportTv:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 1931
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->clearTv:I

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 1932
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->htmlTv:I

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 1934
    sget-object v7, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v7, :cond_0

    sget-object v7, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v7}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v7

    if-nez v7, :cond_0

    sget-object v7, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    if-eqz v7, :cond_0

    .line 1935
    const-string v7, "(PREVIEW)"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1936
    new-instance v7, Lcom/flyersoft/moonreaderp/PrefMisc$78;

    invoke-direct {v7, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$78;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    const/16 v7, 0x8

    .line 1943
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1945
    :goto_0
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 1946
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 1947
    invoke-virtual {v5}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 1948
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$79;

    invoke-direct {v4, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$79;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1963
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$80;

    invoke-direct {v4, v1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$80;-><init>(Lcom/flyersoft/views/RoundButton;Landroid/content/Context;Landroid/widget/LinearLayout;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2007
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$81;

    invoke-direct {v2, v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$81;-><init>(Lcom/flyersoft/views/RoundButton;Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2027
    invoke-static {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->loadReplacesToView(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    .line 2028
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 2029
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "*"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->addNewReplaceItem(Ljava/lang/String;Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V

    .line 2031
    :cond_1
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    return-object v0
.end method

.method private static createProgressDlg(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0

    .line 2362
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->dismissDlg()V

    .line 2363
    invoke-static {p0}, Lcom/flyersoft/tools/A;->createProgressDialog(Landroid/content/Context;)Landroid/app/ProgressDialog;

    move-result-object p0

    sput-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->progressDlg:Landroid/app/ProgressDialog;

    .line 2364
    invoke-virtual {p0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 2365
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->progressDlg:Landroid/app/ProgressDialog;

    invoke-virtual {p0, p2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 2366
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->progressDlg:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Landroid/app/ProgressDialog;->show()V

    return-void
.end method

.method static createTtsFiltersView(Landroid/content/Context;)Landroid/view/View;
    .locals 6

    const/4 v0, 0x0

    .line 1729
    invoke-static {v0}, Lcom/flyersoft/tools/A;->initTTSFilters(Z)V

    .line 1730
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->pref_edit_tts_filter:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 1731
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->replaceLay:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    sput-object v1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    .line 1733
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 1734
    sget-boolean v2, Lcom/flyersoft/tools/A;->tts_filter_with_regular_expression:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1735
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$67;

    invoke-direct {v2}, Lcom/flyersoft/moonreaderp/PrefMisc$67;-><init>()V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1741
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->importTv:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1742
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->exportTv:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 1743
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->clearTv:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 1744
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 1745
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 1746
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 1747
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$68;

    invoke-direct {v4, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$68;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1762
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$69;

    invoke-direct {v3, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$69;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1804
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$70;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$70;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1823
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$71;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$71;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1830
    invoke-static {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->loadTtsFilterToView(Landroid/content/Context;Landroid/widget/LinearLayout;)V

    .line 1831
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    return-object v0
.end method

.method private static dismissDlg()V
    .locals 1

    .line 2995
    :try_start_0
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->progressDlg:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 2996
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 2998
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 3000
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->progressDlg:Landroid/app/ProgressDialog;

    return-void
.end method

.method private static doAfterRestoreFailed(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2

    if-eqz p2, :cond_0

    .line 2502
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\n\nSolution: It may be a network transmission problem. You can manually download the backup file to local storage and then click it to restore the backup again."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2503
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->restore_failed:I

    .line 2504
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 2505
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/4 p1, 0x0

    .line 2506
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 v0, 0x0

    .line 2507
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$97;

    invoke-direct {p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc$97;-><init>(I)V

    const p2, 0x104000a

    .line 2508
    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 2524
    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 2526
    :cond_0
    sget p2, Lcom/flyersoft/moonreaderp/R$string;->restore_failed:I

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static doAfterRestoreSuccess(Landroid/content/Context;)V
    .locals 3

    .line 2487
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->restore_succes:I

    .line 2488
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->restart_manually:I

    .line 2489
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/4 v0, 0x0

    .line 2490
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$96;

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefMisc$96;-><init>()V

    const v1, 0x104000a

    .line 2491
    invoke-virtual {p0, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 2497
    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static doAutoBackup(Landroid/app/ProgressDialog;)V
    .locals 8

    .line 3499
    sget-boolean v0, Lcom/flyersoft/tools/A;->autobackupLocal:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->autobackupCloud:I

    if-nez v0, :cond_0

    goto :goto_2

    .line 3502
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->autobackupType:I

    const/4 v1, 0x1

    if-nez v0, :cond_1

    const-wide/16 v2, 0x1

    :goto_0
    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v2

    goto :goto_1

    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->autobackupType:I

    if-ne v0, v1, :cond_2

    const-wide/16 v2, 0x7

    goto :goto_0

    :cond_2
    const-wide/16 v2, 0x1e

    goto :goto_0

    :goto_1
    if-nez p0, :cond_3

    .line 3503
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-wide v6, Lcom/flyersoft/tools/A;->lastAutoBackupTime:J

    sub-long/2addr v4, v6

    cmp-long v0, v4, v2

    if-gez v0, :cond_3

    :goto_2
    return-void

    :cond_3
    if-nez p0, :cond_4

    const/4 p0, 0x0

    goto :goto_3

    .line 3507
    :cond_4
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$125;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$125;-><init>(Landroid/os/Looper;Landroid/app/ProgressDialog;)V

    move-object p0, v0

    .line 3516
    :goto_3
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$126;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$126;-><init>(Landroid/os/Handler;)V

    .line 3540
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 3541
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static doBackup(Landroid/app/Dialog;)V
    .locals 3

    const/4 v0, 0x1

    .line 2786
    invoke-static {v0}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 2790
    :cond_0
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    .line 2791
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->backup_to:I

    .line 2792
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setTitle(I)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 2793
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->getBackupMethods()[Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$103;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$103;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p0

    .line 2798
    invoke-virtual {p0}, Lcom/flyersoft/components/MyMenu;->show()V

    return-void
.end method

.method public static doRestore(Landroid/app/Dialog;)V
    .locals 3

    const/4 v0, 0x1

    .line 2305
    invoke-static {v0}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 2307
    :cond_0
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    .line 2308
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->restore_from:I

    .line 2309
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setTitle(I)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 2310
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->getBackupMethods()[Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$90;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$90;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p0

    .line 2315
    invoke-virtual {p0}, Lcom/flyersoft/components/MyMenu;->show()V

    return-void
.end method

.method private do_SetCSS()V
    .locals 7

    .line 2257
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->res:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$array;->disable_css_styles:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 2258
    array-length v1, v0

    const/4 v2, 0x1

    add-int/2addr v1, v2

    new-array v3, v1, [Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 2259
    :goto_0
    array-length v6, v0

    if-ge v5, v6, :cond_0

    .line 2260
    aget-object v6, v0, v5

    aput-object v6, v3, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 2262
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->res:Landroid/content/Context;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->disable_css_others:I

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x7

    aput-object v0, v3, v5

    .line 2264
    new-array v0, v1, [Z

    .line 2265
    sget-boolean v1, Lcom/flyersoft/tools/A;->cssFontStyle:Z

    aput-boolean v1, v0, v4

    .line 2266
    sget-boolean v1, Lcom/flyersoft/tools/A;->cssFontSize:Z

    aput-boolean v1, v0, v2

    const/4 v1, 0x2

    .line 2267
    sget-boolean v2, Lcom/flyersoft/tools/A;->cssFontColor:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x3

    .line 2268
    sget-boolean v2, Lcom/flyersoft/tools/A;->cssAlignment:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x4

    .line 2269
    sget-boolean v2, Lcom/flyersoft/tools/A;->cssJustify:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x5

    .line 2270
    sget-boolean v2, Lcom/flyersoft/tools/A;->cssIndent:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x6

    .line 2271
    sget-boolean v2, Lcom/flyersoft/tools/A;->cssLineSpace:Z

    aput-boolean v2, v0, v1

    .line 2272
    sget-boolean v1, Lcom/flyersoft/tools/A;->cssOthers:Z

    aput-boolean v1, v0, v5

    .line 2274
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->res:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->disable_css:I

    .line 2275
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$89;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$89;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;[Z)V

    .line 2276
    invoke-virtual {v1, v3, v0, v2}, Lcom/flyersoft/components/MyDialog;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$88;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$88;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;[Z)V

    const v0, 0x104000a

    .line 2281
    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 2298
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 2299
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private static getAllBookCoversSize()Ljava/lang/String;
    .locals 7

    const-wide/16 v0, 0x0

    .line 3098
    sput-wide v0, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    .line 3099
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 3100
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0x14

    if-le v1, v2, :cond_0

    .line 3101
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 3102
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3103
    sget-wide v3, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v5

    add-long/2addr v3, v5

    sput-wide v3, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    goto :goto_1

    .line 3104
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object v1

    .line 3105
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 3106
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 3107
    sget-wide v3, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v5

    add-long/2addr v3, v5

    sput-wide v3, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    goto :goto_2

    .line 3108
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-wide v1, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpCoversSize:J

    invoke-static {v0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getAllBookFilesSize()Ljava/lang/String;
    .locals 7

    const-wide/16 v0, 0x0

    .line 3113
    sput-wide v0, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    .line 3114
    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 3115
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0x14

    if-le v1, v2, :cond_0

    .line 3116
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 3117
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3118
    sget-wide v3, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v5

    add-long/2addr v3, v5

    sput-wide v3, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    goto :goto_1

    .line 3119
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object v1

    .line 3120
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 3121
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 3122
    sget-wide v3, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v5

    add-long/2addr v3, v5

    sput-wide v3, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    goto :goto_2

    .line 3123
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-wide v1, Lcom/flyersoft/moonreaderp/PrefMisc;->tmpBooksSize:J

    invoke-static {v0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAutoScrollTitle(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 2

    .line 1288
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->auto_scroll_control:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " & "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_0

    .line 1289
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->speed_read:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->deleteEndQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->speed_read:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getBackupMethods()[Ljava/lang/CharSequence;
    .locals 5

    .line 2320
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "#html#"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->local_storage:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/components/MyMenu;->addItemDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2323
    const-string v1, "WebDav"

    .line 2324
    const-string v2, "FTP"

    const-string v3, "Dropbox"

    const-string v4, "Gdrive"

    filled-new-array {v0, v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getDropboxAccountInfo(Landroid/widget/TextView;Landroid/widget/ProgressBar;)V
    .locals 2

    .line 3425
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$123;

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefMisc$123;-><init>()V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 3437
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 3438
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$122;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$122;-><init>(Landroid/widget/TextView;Landroid/widget/ProgressBar;)V

    .line 3439
    invoke-virtual {v0, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method static getViewReplaceList()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$Filter_Item;",
            ">;"
        }
    .end annotation

    .line 2244
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2245
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 2246
    :goto_0
    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    .line 2247
    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2248
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2249
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2250
    new-instance v4, Lcom/flyersoft/tools/A$Filter_Item;

    invoke-direct {v4, v3, v2}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static loadReplacesToView(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 6

    .line 2058
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 2059
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 2060
    :cond_0
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceBookFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getNamesReplacement(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v2, v0

    .line 2061
    :goto_0
    sget-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-gt v1, v3, :cond_1

    .line 2062
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->tts_filter:I

    invoke-virtual {v2, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 2063
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2064
    invoke-static {p0, p1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->setReplaceItemProperties(Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V

    .line 2065
    sget-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-virtual {v3, v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2067
    :cond_1
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->scrollToBottom(Landroid/view/View;)V

    .line 2068
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 2069
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->checkIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V

    return-object v2
.end method

.method private loadSettings()V
    .locals 7

    .line 232
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pcEdge:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->disableEdgeTouch:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 233
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmKeepOneLine:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->keepOneLineWhenPaging:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 235
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmOriginalView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->showChromeButton:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 236
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmFootnote:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->footnoteInChapterText:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 237
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmPageNum:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v1, Lcom/flyersoft/tools/A;->epubPageNum:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 238
    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    .line 239
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmPageNum:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->epub3_page_numbers:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " (Epub)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 241
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmEpubPageSplit:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 242
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmPageNum:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 244
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->cssFont:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->useCssFont:Z

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 245
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->disableCSS:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->disableCSS:Z

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 246
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->disableCSS:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$3;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$3;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    .line 247
    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 256
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pm2Page:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->dualPage:Z

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 257
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmBionic:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->bionic:Z

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 258
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmPageSound:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v3, Lcom/flyersoft/tools/A;->pageSound:Z

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 260
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmRuler:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget v3, Lcom/flyersoft/tools/A;->showRuler:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v3, v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v0, v4}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 261
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmRuler:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$4;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$4;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 272
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->synvTv:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->sync_to_cloud:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "..."

    const-string v6, ""

    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSyncDropbox:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 274
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSyncGdrive:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 275
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSyncWebDav:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 276
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pmSyncFtp:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 277
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-static {v0, v2}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 278
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v2, 0x4

    invoke-static {v0, v2}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 279
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v2, 0x6

    invoke-static {v0, v2}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 280
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-static {v0, v1}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 281
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    if-lez v0, :cond_2

    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v0

    if-nez v0, :cond_2

    .line 282
    sput v5, Lcom/flyersoft/tools/A;->syncType:I

    .line 283
    :cond_2
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->setSyncTypeChecked()V

    .line 284
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 285
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 286
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 287
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->onSyncCheck:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 288
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetFtp:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 289
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetWebDav:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 290
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetDropbox:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 291
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetGdrive:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 293
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmMulti_touch:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->mult_touch:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 294
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmAllowHorizontal:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->allow_scroll_horizontally:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 295
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmDisablemove:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->disableMove:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 297
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmTilt:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->tilt_turn_page:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 298
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmTrimBlankSpaces:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 299
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmTrimTopSpaces:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->trimTopSpace:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 300
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmTxtSplit:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->txtChapterSplit:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 301
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmIndentParagraph:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->indentParagraph:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 303
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmFullscreen:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 304
    sget-boolean v2, Lcom/flyersoft/tools/A;->fullscreen:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 305
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->SDK23()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 306
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 307
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->transparent_notification_bar:I

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setText(I)V

    .line 308
    sget-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-nez v0, :cond_4

    .line 309
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v5}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setEnabled(Z)V

    .line 310
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const v2, -0x777778

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setTextColor(I)V

    goto :goto_2

    .line 313
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->fullscreen:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 314
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->full_screen_mode:I

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setText(I)V

    .line 317
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmKeepScreenAwake:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->keepScreenAwake:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 318
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmAdjustBrightness:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->adjustBrightness:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 319
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmAdjustBFontSize:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->adjustFontSizeAtSlide:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 320
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmOpenLastFile:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->openLastFile:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 321
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSaveConfirm:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->saveFileConfirm:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 323
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmStatusBar:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->showStatusbar:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 324
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemaningTime:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->showRemainingTime:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind1:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->remind1:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 326
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind2:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->remind2:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 328
    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result v0

    if-eqz v0, :cond_5

    .line 329
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmTxtSplit:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 330
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmTxtSplit2:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 333
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->bluelight:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v2, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 334
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->bluelightLay:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v2, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    if-eqz v2, :cond_6

    const/4 v2, 0x0

    goto :goto_3

    :cond_6
    const/16 v2, 0x8

    :goto_3
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 335
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->bluelightLay2:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v2, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    if-eqz v2, :cond_7

    const/4 v1, 0x0

    :cond_7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 336
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bluelightOpacity:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    sget v1, Lcom/flyersoft/tools/A;->bluelightOpacity:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 337
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bluelight:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$5;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 345
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->setIndentCssTip()V

    .line 348
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmBionic:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$6;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$6;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method

.method private static loadTtsFilterToView(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 5

    .line 1836
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 1837
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    :cond_0
    const/4 v0, 0x0

    .line 1838
    :goto_0
    sget-object v1, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 1839
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->tts_filter:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 1840
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1841
    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->setFilterItemProperties(Landroid/view/View;Landroid/view/View;)V

    .line 1842
    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-virtual {v2, v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1844
    :cond_1
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->scrollToBottom(Landroid/view/View;)V

    .line 1845
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-static {p1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->checkIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method private static regularExpressionTip(Landroid/content/Context;)V
    .locals 3

    .line 2036
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->replace_tip:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<br><br><b>\\d+</b>  =  13,24,234... <br><b>\\[\\d+\\]</b>  =  [13],[24],[234]...<br>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2039
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->tip:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    .line 2040
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->more:I

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$82;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$82;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const v0, 0x104000a

    const/4 v1, 0x0

    .line 2051
    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method static replaceBookFile()Ljava/lang/String;
    .locals 1

    .line 1863
    sget-boolean v0, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceForAllBook:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    return-object v0
.end method

.method private static restoreProc(Landroid/app/Dialog;I)V
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    if-ne p1, v2, :cond_2

    const/4 v2, 0x4

    goto :goto_0

    :cond_2
    const/4 v2, 0x3

    if-ne p1, v2, :cond_3

    const/4 v2, 0x6

    goto :goto_0

    :cond_3
    const/16 v2, 0x8

    :goto_0
    if-eqz v2, :cond_5

    .line 2335
    invoke-static {p0, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->validateCloud(Landroid/app/Dialog;I)Z

    move-result v0

    if-nez v0, :cond_4

    return-void

    .line 2337
    :cond_4
    invoke-static {v2}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$91;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$91;-><init>(Landroid/app/Dialog;I)V

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/cloud/Cloud;->getBackupList(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V

    return-void

    .line 2347
    :cond_5
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2348
    sget-object v3, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    invoke-static {v3, v1, v0, v1, v1}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZ)Ljava/util/ArrayList;

    move-result-object v0

    .line 2349
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2350
    const-string v3, ".mrpro"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 2351
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " (pro)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2352
    :cond_7
    const-string v3, ".mrstd"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 2353
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " (std)"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2355
    :cond_8
    invoke-static {p0, p1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_second(Landroid/app/Dialog;ILjava/util/ArrayList;)V

    return-void
.end method

.method public static restoreProc_final(Landroid/content/Context;Landroid/os/Handler;ZI)V
    .locals 4

    .line 2530
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->dismissDlg()V

    .line 2531
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " \""

    if-nez p1, :cond_0

    .line 2532
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->app_name:I

    .line 2531
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->backup:I

    .line 2532
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->restore:I

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 2533
    :cond_0
    const-string v2, ""

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez p1, :cond_1

    .line 2536
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$98;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {p1, v2, p0, p3}, Lcom/flyersoft/moonreaderp/PrefMisc$98;-><init>(Landroid/os/Looper;Landroid/content/Context;I)V

    .line 2552
    :cond_1
    new-instance p3, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p3, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {p3, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->restore:I

    .line 2553
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p3

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$99;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc$99;-><init>(Landroid/content/Context;Landroid/os/Handler;Z)V

    const p0, 0x104000a

    .line 2554
    invoke-virtual {p3, p0, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    .line 2559
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static restoreProc_over(Landroid/content/Context;Landroid/os/Handler;Z)V
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 2564
    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "#restorePro_final start"

    aput-object v2, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2565
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v1

    const-wide/32 v3, 0xf4240

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    .line 2566
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->restore:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->createProgressDlg(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 2567
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$100;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc$100;-><init>(Landroid/content/Context;Landroid/os/Handler;Z)V

    .line 2572
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc$100;->start()V

    return-void

    .line 2574
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_over2(Landroid/content/Context;Landroid/os/Handler;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 2576
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    if-eqz p1, :cond_1

    .line 2578
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method public static restoreProc_over2(Landroid/content/Context;Landroid/os/Handler;Z)V
    .locals 8

    .line 2583
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    sget-object p0, Lcom/flyersoft/tools/A;->appDataPath:Ljava/lang/String;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$101;

    invoke-direct {v3, p2, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$101;-><init>(ZLandroid/os/Handler;)V

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x1

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Lcom/flyersoft/tools/compress/MyZip_Java;->unZipFile(Ljava/lang/String;Ljava/lang/String;ZLcom/flyersoft/tools/compress/MyZip_Base$ZipDone;ZZZLandroid/os/Handler;)V

    return-void
.end method

.method private static restoreProc_second(Landroid/app/Dialog;ILjava/util/ArrayList;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Dialog;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    if-ne p1, v1, :cond_1

    goto :goto_0

    :cond_1
    if-ne p1, v2, :cond_2

    const/4 v2, 0x4

    goto :goto_0

    :cond_2
    const/4 v2, 0x3

    if-ne p1, v2, :cond_3

    const/4 v2, 0x6

    goto :goto_0

    :cond_3
    const/16 v2, 0x8

    :goto_0
    const/4 v3, 0x0

    .line 2372
    sput-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->progressDlg:Landroid/app/ProgressDialog;

    .line 2373
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$92;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5, p0, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$92;-><init>(Landroid/os/Looper;Landroid/app/Dialog;I)V

    .line 2394
    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->sortBackupList(Ljava/util/ArrayList;)V

    .line 2395
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    .line 2396
    sput-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    if-nez p1, :cond_4

    .line 2398
    sget-object v5, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    goto :goto_1

    :cond_4
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->getBackupMethods()[Ljava/lang/CharSequence;

    move-result-object v5

    aget-object v5, v5, p1

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2399
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v7

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->restore_from:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ""

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2400
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v6

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->Folders:I

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 2401
    const-string v7, "s"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 2402
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v1

    invoke-virtual {v6, v0, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 2404
    :cond_5
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 2405
    invoke-virtual {v0, v5}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefMisc$94;

    invoke-direct {v5, p2}, Lcom/flyersoft/moonreaderp/PrefMisc$94;-><init>([Ljava/lang/String;)V

    const/4 v7, -0x1

    .line 2406
    invoke-virtual {v1, p2, v7, v5}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$93;

    invoke-direct {v1, p0, v2, v4}, Lcom/flyersoft/moonreaderp/PrefMisc$93;-><init>(Landroid/app/Dialog;ILandroid/os/Handler;)V

    const v2, 0x104000a

    .line 2411
    invoke-virtual {p2, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    const/high16 v1, 0x1040000

    .line 2459
    invoke-virtual {p2, v1, v3}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    if-nez p1, :cond_6

    .line 2462
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$95;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$95;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v0, v6, p1}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 2483
    :cond_6
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method static saveFilterList()V
    .locals 5

    .line 2231
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    .line 2232
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 2233
    :goto_0
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 2234
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2235
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2236
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2237
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2238
    sget-object v3, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    new-instance v4, Lcom/flyersoft/tools/A$Filter_Item;

    invoke-direct {v4, v2, v1}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private saveOptions()V
    .locals 2

    .line 407
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pcEdge:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->disableEdgeTouch:Z

    .line 408
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmOriginalView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->showChromeButton:Z

    .line 409
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmFootnote:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->footnoteInChapterText:Z

    .line 410
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmPageNum:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->epubPageNum:Z

    .line 411
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cssFont:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->useCssFont:Z

    .line 412
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->disableCSS:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->disableCSS:Z

    .line 413
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pm2Page:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->dualPage:Z

    .line 414
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmPageSound:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->pageSound:Z

    .line 416
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmBionic:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->bionic:Z

    .line 417
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmDisablemove:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->disableMove:Z

    .line 418
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmMulti_touch:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->mult_touch:Z

    .line 419
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmAllowHorizontal:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->allow_scroll_horizontally:Z

    .line 420
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmTilt:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->tilt_turn_page:Z

    .line 421
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmTrimBlankSpaces:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    .line 422
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmTrimTopSpaces:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->trimTopSpace:Z

    .line 423
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmTxtSplit:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->txtChapterSplit:Z

    .line 424
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmIndentParagraph:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->indentParagraph:Z

    .line 427
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->SDK23()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 428
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    goto :goto_0

    .line 430
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fullscreenSwitch:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->fullscreen:Z

    .line 433
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmKeepScreenAwake:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->keepScreenAwake:Z

    .line 434
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmAdjustBrightness:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->adjustBrightness:Z

    .line 435
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmAdjustBFontSize:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->adjustFontSizeAtSlide:Z

    .line 436
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmKeepOneLine:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->keepOneLineWhenPaging:Z

    .line 437
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmOpenLastFile:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->openLastFile:Z

    .line 438
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSaveConfirm:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->saveFileConfirm:Z

    .line 439
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmStatusBar:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->showStatusbar:Z

    .line 440
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmRemaningTime:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->showRemainingTime:Z

    .line 441
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmRemind1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->remind1:Z

    .line 442
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmRemind2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->remind2:Z

    .line 444
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bluelight:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    .line 445
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bluelightOpacity:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->bluelightOpacity:I

    .line 447
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmTtsDivides:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    sput v0, Lcom/flyersoft/tools/A;->tts_divide:I

    .line 448
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/tools/A;->invokeRemind1Time:J

    .line 449
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->res:Landroid/content/Context;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    return-void
.end method

.method static scrollToBottom(Landroid/view/View;)V
    .locals 3

    if-nez p0, :cond_0

    goto :goto_0

    .line 1851
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/ScrollView;

    if-nez v0, :cond_1

    goto :goto_0

    .line 1853
    :cond_1
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$72;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$72;-><init>(Landroid/view/View;)V

    const-wide/16 v1, 0x32

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    :goto_0
    return-void
.end method

.method public static setBrightnessOptions(Landroid/content/Context;ZZ)Landroid/view/View;
    .locals 7

    .line 1495
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->led_options:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 1496
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->Spinner01:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 1498
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->autoCheck:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 1499
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->screenBrightness:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/SeekBar;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz p1, :cond_2

    .line 1501
    sget p1, Lcom/flyersoft/tools/A;->brightnessValue:I

    const/16 v6, -0x64

    if-ne p1, v6, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v2, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1502
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$55;

    invoke-direct {p1, v3}, Lcom/flyersoft/moonreaderp/PrefMisc$55;-><init>(Landroid/widget/SeekBar;)V

    invoke-virtual {v2, p1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1511
    sget p1, Lcom/flyersoft/tools/A;->brightnessValue:I

    if-lez p1, :cond_1

    sget p1, Lcom/flyersoft/tools/A;->brightnessValue:I

    sub-int/2addr p1, v5

    goto :goto_1

    :cond_1
    const/16 p1, 0x32

    :goto_1
    invoke-virtual {v3, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1512
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$56;

    invoke-direct {p1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$56;-><init>(Landroid/widget/CheckBox;)V

    invoke-virtual {v3, p1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    goto :goto_2

    .line 1524
    :cond_2
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->adjustLay:I

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 v2, 0x8

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1526
    :goto_2
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->restoreCb:I

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    .line 1527
    sget v2, Lcom/flyersoft/moonreaderp/R$string;->restore_brightness_after_pause:I

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->restoreBrightMins:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v4

    invoke-virtual {p0, v2, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 1528
    sget-boolean v2, Lcom/flyersoft/tools/A;->restoreAutoBright:Z

    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    if-nez p2, :cond_3

    return-object v0

    .line 1532
    :cond_3
    sget p2, Lcom/flyersoft/tools/A;->brightness_edge:I

    invoke-virtual {v1, p2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1534
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->brightness:I

    invoke-virtual {p2, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$57;

    invoke-direct {v2, v1, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$57;-><init>(Landroid/widget/Spinner;Landroid/widget/CheckBox;)V

    const v1, 0x104000a

    .line 1535
    invoke-virtual {p2, v1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    .line 1540
    invoke-virtual {p2}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 1542
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->restoreIb:I

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$58;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$58;-><init>(Landroid/content/Context;Landroid/widget/CheckBox;)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method static setFilterItemProperties(Landroid/view/View;Landroid/view/View;)V
    .locals 5

    .line 2074
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2075
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 2076
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 2077
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->arrow:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 2078
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->op:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 2079
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 2080
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$83;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$83;-><init>(Landroid/view/View;)V

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2101
    sget-object p0, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const-string p1, ""

    if-ge v0, p0, :cond_0

    sget-object p0, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/tools/A$Filter_Item;

    iget-object p0, p0, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object p0, p1

    :goto_0
    invoke-virtual {v1, p0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2102
    sget-object p0, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge v0, p0, :cond_1

    sget-object p0, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/tools/A$Filter_Item;

    iget-object p1, p0, Lcom/flyersoft/tools/A$Filter_Item;->replaceWith:Ljava/lang/String;

    :cond_1
    invoke-virtual {v2, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2103
    sget-object p0, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ne v0, p0, :cond_2

    const/4 p0, 0x4

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    .line 2104
    :goto_1
    invoke-virtual {v1, p0}, Landroid/widget/EditText;->setVisibility(I)V

    .line 2105
    invoke-virtual {v2, p0}, Landroid/widget/EditText;->setVisibility(I)V

    const/high16 p1, 0x41700000    # 15.0f

    .line 2106
    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 2107
    invoke-virtual {v2, p1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 2108
    invoke-virtual {v3, p0}, Landroid/view/View;->setVisibility(I)V

    .line 2109
    sget-object p0, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ne v0, p0, :cond_3

    const-string p0, "+"

    goto :goto_2

    :cond_3
    const-string p0, "-"

    :goto_2
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setIndentCssTip()V
    .locals 2

    .line 362
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmIndentParagraph:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$7;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$7;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method

.method static setListLayVisible(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 6

    if-nez p0, :cond_0

    goto/16 :goto_4

    .line 2204
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    .line 2205
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_4

    .line 2206
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2207
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2208
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2209
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2210
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2211
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 2215
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    .line 2216
    :goto_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_4

    .line 2217
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2218
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2219
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2220
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_2

    :cond_2
    const/16 v3, 0x8

    .line 2226
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_3

    .line 2222
    :cond_3
    :goto_2
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    invoke-static {v3, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2223
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    invoke-static {v4, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2224
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    :goto_4
    return-void
.end method

.method private setPageSound()V
    .locals 8

    .line 1169
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->page_sound:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1170
    sget-object v1, Lcom/flyersoft/tools/A;->pageSoundFile:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/flyersoft/tools/A;->pageSoundFile:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1171
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->sound_file:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    move-object v7, v1

    .line 1172
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " 1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " 2"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " 3"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " 4"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " 5"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v0

    .line 1173
    sget v1, Lcom/flyersoft/tools/A;->pageSoundIndex:I

    .line 1175
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->pageSoundDlg:Lcom/flyersoft/components/MyDialog;

    if-eqz v2, :cond_1

    .line 1176
    invoke-virtual {v2}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    .line 1177
    :cond_1
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->pageSoundDlg:Lcom/flyersoft/components/MyDialog;

    .line 1178
    sget v3, Lcom/flyersoft/moonreaderp/R$string;->page_sound:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$42;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$42;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    .line 1179
    invoke-virtual {v2, v0, v1, v3}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$41;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$41;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    const v3, 0x104000a

    .line 1189
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$40;

    invoke-direct {v2, p0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc$40;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;I)V

    const/high16 v3, 0x1040000

    .line 1195
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$39;

    invoke-direct {v2, p0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc$39;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;I)V

    .line 1201
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->button_options:I

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$38;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$38;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    .line 1208
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1229
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method static setReplaceItemProperties(Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V
    .locals 5

    .line 2113
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2114
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 2115
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 2116
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->arrow:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 2117
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->op:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 2118
    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 2119
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefMisc$84;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$84;-><init>(Landroid/content/Context;Landroid/view/View;)V

    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2131
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const-string p1, ""

    if-ge v0, p0, :cond_0

    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/tools/A$Filter_Item;

    iget-object p0, p0, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object p0, p1

    :goto_0
    invoke-virtual {v1, p0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2132
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge v0, p0, :cond_1

    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/tools/A$Filter_Item;

    iget-object p1, p0, Lcom/flyersoft/tools/A$Filter_Item;->replaceWith:Ljava/lang/String;

    :cond_1
    invoke-virtual {v2, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2133
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ne v0, p0, :cond_2

    const/4 p0, 0x4

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    .line 2134
    :goto_1
    invoke-virtual {v1, p0}, Landroid/widget/EditText;->setVisibility(I)V

    .line 2135
    invoke-virtual {v2, p0}, Landroid/widget/EditText;->setVisibility(I)V

    const/high16 p1, 0x41700000    # 15.0f

    .line 2136
    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 2137
    invoke-virtual {v2, p1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 2138
    invoke-virtual {v3, p0}, Landroid/view/View;->setVisibility(I)V

    .line 2139
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->repalcesList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ne v0, p0, :cond_3

    const-string p0, "+"

    goto :goto_2

    :cond_3
    const-string p0, "-"

    :goto_2
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static setSyncTypeChecked()V
    .locals 5

    .line 3414
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 3415
    sget v3, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3416
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz v0, :cond_3

    .line 3417
    sget v3, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3418
    :cond_3
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz v0, :cond_5

    .line 3419
    sget v3, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v4, 0x6

    if-ne v3, v4, :cond_4

    const/4 v3, 0x1

    goto :goto_2

    :cond_4
    const/4 v3, 0x0

    :goto_2
    invoke-virtual {v0, v3}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3420
    :cond_5
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz v0, :cond_7

    .line 3421
    sget v3, Lcom/flyersoft/tools/A;->syncType:I

    const/16 v4, 0x8

    if-ne v3, v4, :cond_6

    goto :goto_3

    :cond_6
    const/4 v1, 0x0

    :goto_3
    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    :cond_7
    return-void
.end method

.method public static setTTSFilter(Landroid/content/Context;)V
    .locals 3

    .line 1565
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x41400000    # 12.0f

    .line 1566
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setPaddingLeft(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1567
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setPaddingRight(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1568
    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->createTtsFiltersView(Landroid/content/Context;)Landroid/view/View;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$61;

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefMisc$61;-><init>()V

    const v1, 0x104000a

    invoke-virtual {p0, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$60;

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefMisc$60;-><init>()V

    const/high16 v1, 0x1040000

    .line 1574
    invoke-virtual {p0, v1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$59;

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefMisc$59;-><init>()V

    .line 1579
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/4 v0, 0x0

    .line 1585
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static setTiltOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 11

    .line 1669
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->tilt_options:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1671
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ofNeverAskAgain:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/widget/CheckBox;

    .line 1672
    sget-boolean v1, Lcom/flyersoft/tools/A;->askForTiltAction:Z

    invoke-virtual {v3, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1673
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->forwardSb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/SeekBar;

    .line 1674
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backwordSb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/SeekBar;

    .line 1675
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->forwardSp:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/Spinner;

    .line 1676
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->backwordSp:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/Spinner;

    .line 1679
    invoke-static {}, Lcom/flyersoft/tools/A;->getLangContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->controls:I

    const/4 v8, 0x1

    invoke-static {v1, v2, v8}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    .line 1680
    invoke-static {}, Lcom/flyersoft/tools/A;->getLangContext()Landroid/content/Context;

    move-result-object v2

    sget v8, Lcom/flyersoft/moonreaderp/R$array;->controls:I

    const/4 v9, 0x0

    invoke-static {v2, v8, v9}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    .line 1681
    invoke-static {}, Lcom/flyersoft/tools/A;->getLangContext()Landroid/content/Context;

    move-result-object v8

    sget v9, Lcom/flyersoft/moonreaderp/R$array;->controls:I

    const/16 v10, 0xf

    invoke-static {v8, v9, v10}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v1, v2, v8}, [Ljava/lang/String;

    move-result-object v1

    .line 1683
    new-instance v2, Landroid/widget/ArrayAdapter;

    const v8, 0x1090008

    invoke-direct {v2, p0, v8, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v1, 0x1090009

    .line 1685
    invoke-virtual {v2, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 1686
    invoke-virtual {v6, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 1687
    invoke-virtual {v7, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 1689
    sget v1, Lcom/flyersoft/tools/A;->tilt_forward:I

    invoke-virtual {v6, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1690
    sget v1, Lcom/flyersoft/tools/A;->tilt_backward:I

    invoke-virtual {v7, v1}, Landroid/widget/Spinner;->setSelection(I)V

    const/16 v1, 0x28

    .line 1691
    invoke-virtual {v4, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 1692
    invoke-virtual {v5, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 1693
    sget v1, Lcom/flyersoft/tools/A;->tilt_forward_sensitive:F

    const/high16 v2, 0x41200000    # 10.0f

    mul-float v1, v1, v2

    const/high16 v8, 0x422c0000    # 43.0f

    sub-float v1, v8, v1

    float-to-int v1, v1

    invoke-virtual {v4, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1694
    sget v1, Lcom/flyersoft/tools/A;->tilt_backward_sensitive:F

    mul-float v1, v1, v2

    sub-float/2addr v8, v1

    float-to-int v1, v8

    invoke-virtual {v5, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1696
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1697
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, -0x888889

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1698
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1701
    :cond_0
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget p0, Lcom/flyersoft/moonreaderp/R$string;->tilt_turn_page:I

    invoke-virtual {v1, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$66;

    move-object v8, p1

    invoke-direct/range {v2 .. v8}, Lcom/flyersoft/moonreaderp/PrefMisc$66;-><init>(Landroid/widget/CheckBox;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/Spinner;Landroid/widget/Spinner;Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    const p1, 0x104000a

    .line 1702
    invoke-virtual {p0, p1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$65;

    invoke-direct {p1, v8, v3}, Lcom/flyersoft/moonreaderp/PrefMisc$65;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/CheckBox;)V

    const v0, 0x1040009

    .line 1716
    invoke-virtual {p0, v0, p1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 1724
    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static showAutoScrollSettings(Landroid/content/Context;Z)Landroid/view/View;
    .locals 9

    .line 1233
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->scroll_event_confirm:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    .line 1234
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ofNeverAskAgain:I

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 1235
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->gestureTv:I

    invoke-virtual {v0, v3}, Landroid/widget/ScrollView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 1236
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->Control_gestures:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1237
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->show_confirmation_dialog:I

    invoke-virtual {v1, v4}, Landroid/widget/CheckBox;->setText(I)V

    if-nez p1, :cond_0

    return-object v0

    .line 1242
    :cond_0
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$43;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$43;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1249
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    const/4 v3, 0x0

    if-nez p1, :cond_1

    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 1250
    :goto_0
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->pmScrollSpeed:I

    invoke-virtual {v0, v4}, Landroid/widget/ScrollView;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/SeekBar;

    .line 1251
    sget v5, Lcom/flyersoft/tools/A;->autoScrollSpeed:I

    rsub-int/lit8 v5, v5, 0x64

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1252
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->pmScrollMode:I

    invoke-virtual {v0, v5}, Landroid/widget/ScrollView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Spinner;

    .line 1253
    new-instance v6, Landroid/widget/ArrayAdapter;

    if-eqz p1, :cond_2

    .line 1255
    invoke-static {}, Lcom/flyersoft/tools/A;->getPdfAutoScrollModes()[Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoScrollModes()[Ljava/lang/String;

    move-result-object v7

    :goto_1
    const v8, 0x1090008

    invoke-direct {v6, p0, v8, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v7, 0x1090009

    .line 1256
    invoke-virtual {v6, v7}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 1257
    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 1258
    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getScrollModeIndex(Z)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1259
    sget-boolean v6, Lcom/flyersoft/tools/A;->askForScrollEvent:Z

    invoke-virtual {v1, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1261
    new-instance v6, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v6, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 1262
    invoke-static {p0, v3}, Lcom/flyersoft/moonreaderp/PrefMisc;->getAutoScrollTitle(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v6, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 1263
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$44;

    invoke-direct {v3, v1, v5, p1, v4}, Lcom/flyersoft/moonreaderp/PrefMisc$44;-><init>(Landroid/widget/CheckBox;Landroid/widget/Spinner;ZLandroid/widget/SeekBar;)V

    const p1, 0x104000a

    .line 1264
    invoke-virtual {p0, p1, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 p1, 0x1040000

    .line 1274
    invoke-virtual {p0, p1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-object v0
.end method

.method private static showBackupSuccessInfo(Ljava/lang/String;Landroid/content/Context;)V
    .locals 6

    .line 3128
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->backup_succes:I

    .line 3129
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3131
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3130
    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v1, 0x104000a

    const/4 v2, 0x0

    .line 3132
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->send_file:I

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$116;

    invoke-direct {v2, p1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$116;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 3133
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 3139
    invoke-virtual {p0, v3}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static showCloudOptions(Landroid/content/Context;IZ)V
    .locals 4

    .line 3252
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    .line 3253
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x6

    if-nez v1, :cond_4

    .line 3254
    sget p2, Lcom/flyersoft/moonreaderp/R$string;->unlink_hint:I

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    const/4 p0, 0x2

    if-ne p1, p0, :cond_0

    .line 3255
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz p0, :cond_0

    .line 3256
    invoke-virtual {p0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->performClick()Z

    :cond_0
    const/4 p0, 0x4

    if-ne p1, p0, :cond_1

    .line 3257
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz p0, :cond_1

    .line 3258
    invoke-virtual {p0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->performClick()Z

    :cond_1
    if-ne p1, v3, :cond_2

    .line 3259
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz p0, :cond_2

    .line 3260
    invoke-virtual {p0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->performClick()Z

    :cond_2
    if-ne p1, v2, :cond_3

    .line 3261
    sget-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz p0, :cond_3

    .line 3262
    invoke-virtual {p0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->performClick()Z

    :cond_3
    return-void

    :cond_4
    if-eq p1, v3, :cond_6

    if-ne p1, v2, :cond_5

    goto :goto_0

    .line 3269
    :cond_5
    invoke-static {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->showStdCloudOptions(Landroid/content/Context;IZ)V

    return-void

    :cond_6
    :goto_0
    const/4 p1, 0x0

    .line 3267
    invoke-virtual {v0, p0, p2, p1}, Lcom/flyersoft/components/cloud/Cloud;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    return-void
.end method

.method public static showCssFontOptions(Landroid/app/Dialog;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V
    .locals 7

    .line 1443
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1444
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    .line 1445
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1446
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/high16 v3, 0x40c00000    # 6.0f

    .line 1447
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    const/high16 v5, 0x41200000    # 10.0f

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    const/high16 v6, 0x41800000    # 16.0f

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-virtual {v2, v4, v5, v3, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 v3, 0x41900000    # 18.0f

    .line 1448
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v3, -0x1

    .line 1449
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1450
    sget v3, Lcom/flyersoft/material/components/icons/R$drawable;->textfield_activated_holo_dark:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 1451
    sget-object v3, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1452
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$52;

    invoke-direct {v3, v0, v2, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$52;-><init>(Landroid/content/Context;Landroid/widget/TextView;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1465
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1466
    new-instance p1, Landroid/widget/CheckBox;

    invoke-direct {p1, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 1467
    sget-boolean v2, Lcom/flyersoft/tools/A;->miss_font_hint:Z

    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1468
    sget v2, Lcom/flyersoft/moonreaderp/R$string;->pdf_missed_font_hint:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->file_manager:I

    .line 1469
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1468
    const-string v4, "(?i)pdf"

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 1470
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$53;

    invoke-direct {v2}, Lcom/flyersoft/moonreaderp/PrefMisc$53;-><init>()V

    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1476
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1477
    invoke-virtual {p1}, Landroid/widget/CheckBox;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    iput v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 1479
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 1480
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->font_folder:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v1, 0x104000a

    const/4 v2, 0x0

    .line 1481
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 1484
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->fonts_replacement:I

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$54;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$54;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 1491
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static showFullScreenSettings(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc;Z)Landroid/view/View;
    .locals 12

    .line 1293
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x41000000    # 8.0f

    .line 1294
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v1, 0x1

    .line 1295
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1296
    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 1297
    new-instance v3, Landroid/widget/CheckBox;

    invoke-direct {v3, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 1298
    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v4, Landroid/widget/CheckBox;

    invoke-direct {v4, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 1300
    :goto_0
    sget-boolean v6, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    .line 1301
    sget-boolean v7, Lcom/flyersoft/tools/A;->fullscreen:Z

    .line 1302
    sget-boolean v8, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    .line 1303
    sget v9, Lcom/flyersoft/tools/A;->fitCutout:I

    .line 1305
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1306
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->immersive_full_screen:I

    invoke-virtual {v2, v5}, Landroid/widget/CheckBox;->setText(I)V

    .line 1307
    sget-boolean v5, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    invoke-virtual {v2, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1308
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1310
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->SDK23()Z

    move-result v5

    if-eqz v5, :cond_1

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->full_screen_mode:I

    goto :goto_1

    :cond_1
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->transparent_notification_bar:I

    :goto_1
    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setText(I)V

    .line 1311
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->SDK23()Z

    move-result v5

    if-eqz v5, :cond_2

    sget-boolean v5, Lcom/flyersoft/tools/A;->fullscreen:Z

    goto :goto_2

    :cond_2
    sget-boolean v5, Lcom/flyersoft/tools/A;->fullscreenWithStatus:Z

    :goto_2
    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    const/16 v5, 0x8

    if-eqz v4, :cond_5

    .line 1314
    sget-boolean v10, Lcom/flyersoft/tools/A;->isMIUI13:Z

    if-eqz v10, :cond_3

    .line 1315
    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 1316
    sput v1, Lcom/flyersoft/tools/A;->fitCutout:I

    .line 1318
    :cond_3
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1319
    sget v10, Lcom/flyersoft/moonreaderp/R$string;->fit_notch_screen:I

    invoke-virtual {v4, v10}, Landroid/widget/CheckBox;->setText(I)V

    .line 1320
    sget v10, Lcom/flyersoft/tools/A;->fitCutout:I

    if-ne v10, v1, :cond_4

    const/4 v10, 0x1

    goto :goto_3

    :cond_4
    const/4 v10, 0x0

    :goto_3
    invoke-virtual {v4, v10}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1321
    new-instance v10, Lcom/flyersoft/moonreaderp/PrefMisc$45;

    invoke-direct {v10}, Lcom/flyersoft/moonreaderp/PrefMisc$45;-><init>()V

    invoke-virtual {v4, v10}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_5
    if-nez p2, :cond_6

    return-object v0

    .line 1332
    :cond_6
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefMisc$46;

    invoke-direct {p2, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$46;-><init>(Landroid/widget/CheckBox;)V

    invoke-virtual {v2, p2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1339
    sget-boolean p2, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-nez p2, :cond_7

    if-eqz v4, :cond_7

    .line 1340
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefMisc$47;

    invoke-direct {p2, v4}, Lcom/flyersoft/moonreaderp/PrefMisc$47;-><init>(Landroid/widget/CheckBox;)V

    const-wide/16 v10, 0x32

    invoke-virtual {v0, p2, v10, v11}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1349
    :cond_7
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefMisc$48;

    invoke-direct {p2, p1, v3, v4}, Lcom/flyersoft/moonreaderp/PrefMisc$48;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V

    invoke-virtual {v3, p2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1367
    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result p2

    if-nez p2, :cond_8

    invoke-static {}, Lcom/flyersoft/tools/A;->AndroidP()Z

    move-result p2

    if-eqz p2, :cond_9

    .line 1368
    :cond_8
    invoke-virtual {v2, v5}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 1369
    sput-boolean v1, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    .line 1370
    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1373
    :cond_9
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget p0, Lcom/flyersoft/moonreaderp/R$string;->full_screen_mode:I

    invoke-virtual {p2, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefMisc$49;

    move-object v10, p1

    invoke-direct/range {v5 .. v10}, Lcom/flyersoft/moonreaderp/PrefMisc$49;-><init>(ZZZILcom/flyersoft/moonreaderp/PrefMisc;)V

    const p1, 0x104000a

    .line 1374
    invoke-virtual {p0, p1, v5}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 1382
    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-object v0
.end method

.method public static showImageOptions(Landroid/content/Context;Z)Landroid/view/View;
    .locals 9

    .line 1387
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->image_options:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1388
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb0:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/CheckBox;

    .line 1389
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/CheckBox;

    .line 1390
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/CheckBox;

    .line 1391
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/CheckBox;

    .line 1392
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/CheckBox;

    .line 1393
    sget-boolean v1, Lcom/flyersoft/tools/A;->reduceImageBrightness:Z

    invoke-virtual {v4, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1394
    sget-boolean v1, Lcom/flyersoft/tools/A;->imageWhiteTransparent:Z

    invoke-virtual {v5, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1395
    sget-boolean v1, Lcom/flyersoft/tools/A;->fitImageToScreen:Z

    invoke-virtual {v6, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1396
    sget-boolean v1, Lcom/flyersoft/tools/A;->longTapImageFullScreen:Z

    invoke-virtual {v7, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1397
    sget-boolean v1, Lcom/flyersoft/tools/A;->galleryWhiteBackground:Z

    invoke-virtual {v8, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    if-nez p1, :cond_0

    return-object v0

    .line 1402
    :cond_0
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->cb0option:I

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$50;

    invoke-direct {v1, p0, v4}, Lcom/flyersoft/moonreaderp/PrefMisc$50;-><init>(Landroid/content/Context;Landroid/widget/CheckBox;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1424
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget p0, Lcom/flyersoft/moonreaderp/R$string;->image_display_options:I

    invoke-virtual {p1, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$51;

    invoke-direct/range {v3 .. v8}, Lcom/flyersoft/moonreaderp/PrefMisc$51;-><init>(Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V

    const p1, 0x104000a

    .line 1425
    invoke-virtual {p0, p1, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 p1, 0x1040000

    .line 1438
    invoke-virtual {p0, p1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-object v0
.end method

.method public static showReplacmentDialog(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;Ljava/lang/String;)V
    .locals 2

    .line 1593
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 1594
    invoke-static {p0, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->createNamesReplacementView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    const/high16 v0, 0x41400000    # 12.0f

    .line 1595
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {p2, v1}, Lcom/flyersoft/components/MyDialog;->setPaddingLeft(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    .line 1596
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setPaddingRight(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$63;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc$63;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;)V

    const p0, 0x104000a

    .line 1597
    invoke-virtual {p2, p0, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance p1, Lcom/flyersoft/moonreaderp/PrefMisc$62;

    invoke-direct {p1}, Lcom/flyersoft/moonreaderp/PrefMisc$62;-><init>()V

    const/high16 p2, 0x1040000

    .line 1606
    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/4 p1, 0x0

    .line 1610
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static showShelfOptions(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8

    .line 3465
    sget v1, Lcom/flyersoft/tools/A;->languageID:I

    .line 3466
    sget-boolean v3, Lcom/flyersoft/tools/A;->woody:Z

    .line 3467
    sget v4, Lcom/flyersoft/tools/A;->woodyResDay:I

    .line 3468
    sget v5, Lcom/flyersoft/tools/A;->woodyResNight:I

    .line 3469
    sget-boolean v6, Lcom/flyersoft/tools/A;->coverWithProgress:Z

    .line 3470
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    const/4 v0, 0x0

    .line 3471
    sput-boolean v0, Lcom/flyersoft/tools/A;->woodyChanged:Z

    .line 3473
    new-instance v7, Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {v7, p0, v0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf;-><init>(Landroid/content/Context;ZLjava/lang/String;)V

    .line 3474
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$124;

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/moonreaderp/PrefMisc$124;-><init>(ILandroid/content/Context;ZIIZ)V

    invoke-virtual {v7, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 3495
    invoke-virtual {v7}, Lcom/flyersoft/moonreaderp/PrefShelf;->show()V

    return-void
.end method

.method public static showStdCloudOptions(Landroid/content/Context;IZ)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v8, p1

    .line 3273
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->dropbox_options:I

    const/4 v9, 0x0

    invoke-virtual {v1, v2, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 3274
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->button1:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 3275
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncReadingProgress:I

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    .line 3276
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->syncShelf:I

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    .line 3277
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->syncShowMessage:I

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    .line 3278
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->syncButtonOnly:I

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/CheckBox;

    .line 3279
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->syncViaMenuOnly:I

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/CheckBox;

    .line 3280
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->syncWifiOnly:I

    invoke-virtual {v1, v10}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/CheckBox;

    .line 3281
    sget v11, Lcom/flyersoft/moonreaderp/R$id;->progressBar:I

    invoke-virtual {v1, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ProgressBar;

    .line 3282
    sget v12, Lcom/flyersoft/moonreaderp/R$id;->info:I

    invoke-virtual {v1, v12}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 3283
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->path:I

    invoke-virtual {v1, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/EditText;

    const/4 v14, 0x4

    if-ne v8, v14, :cond_0

    .line 3286
    invoke-static {v1, v14}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    .line 3287
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v15

    invoke-interface {v15}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "<br><small>"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->getGdrive()Lcom/flyersoft/components/cloud/Gdrive;

    move-result-object v15

    iget-object v15, v15, Lcom/flyersoft/components/cloud/Gdrive;->account:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    invoke-virtual {v15}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getEmail()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "<small>"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v14

    invoke-virtual {v2, v14}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 3289
    :cond_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v8}, Lcom/flyersoft/components/cloud/Cloud;->getCloudTag(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v8}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 3293
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v14

    if-nez v14, :cond_2

    .line 3294
    sget-boolean v14, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eqz v14, :cond_1

    const/4 v14, 0x0

    .line 3295
    sput-boolean v14, Lcom/flyersoft/tools/A;->syncShelf:Z

    :cond_1
    const v14, -0x777778

    .line 3296
    invoke-virtual {v4, v14}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 3297
    invoke-virtual {v4}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/text/TextPaint;->setStrikeThruText(Z)V

    .line 3298
    const-string v14, "ignore"

    invoke-virtual {v4, v14}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 3301
    :cond_2
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->hasDownloadUploadRecords()Z

    move-result v14

    const/16 v15, 0x8

    if-nez v14, :cond_3

    .line 3302
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->clearRecords:I

    invoke-virtual {v1, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14, v15}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 3304
    :cond_3
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->clearRecords:I

    invoke-virtual {v1, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    new-instance v9, Lcom/flyersoft/moonreaderp/PrefMisc$118;

    invoke-direct {v9, v1}, Lcom/flyersoft/moonreaderp/PrefMisc$118;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v14, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3312
    :goto_0
    sget-boolean v9, Lcom/flyersoft/tools/A;->syncProgress:Z

    invoke-virtual {v3, v9}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 3313
    sget-boolean v9, Lcom/flyersoft/tools/A;->syncShelf:Z

    invoke-virtual {v4, v9}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 3314
    sget-boolean v9, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-virtual {v5, v9}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 3315
    sget-boolean v9, Lcom/flyersoft/tools/A;->syncManually:Z

    invoke-virtual {v6, v9}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 3316
    sget-boolean v9, Lcom/flyersoft/tools/A;->syncShelfViaMenuOnly:Z

    invoke-virtual {v7, v9}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 3317
    sget-boolean v9, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    invoke-virtual {v10, v9}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 3318
    invoke-virtual {v12, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3320
    sget-boolean v9, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    if-nez v9, :cond_4

    .line 3321
    invoke-virtual {v10, v15}, Landroid/widget/CheckBox;->setVisibility(I)V

    :cond_4
    if-nez p2, :cond_5

    .line 3323
    sget v9, Lcom/flyersoft/tools/A;->syncType:I

    if-eq v9, v8, :cond_6

    .line 3324
    :cond_5
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->syncLay:I

    invoke-virtual {v1, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9, v15}, Landroid/view/View;->setVisibility(I)V

    .line 3325
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->moreLay:I

    invoke-virtual {v1, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9, v15}, Landroid/view/View;->setVisibility(I)V

    .line 3328
    :cond_6
    new-instance v9, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v9, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 3330
    new-instance v14, Lcom/flyersoft/moonreaderp/PrefMisc$119;

    invoke-direct {v14, v9, v8}, Lcom/flyersoft/moonreaderp/PrefMisc$119;-><init>(Lcom/flyersoft/components/MyDialog;I)V

    invoke-virtual {v2, v14}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3339
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$120;

    invoke-direct {v2, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$120;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 3372
    invoke-static {v8}, Lcom/flyersoft/components/cloud/Cloud;->getCloudName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v9

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$121;

    move-object v1, v3

    move-object v2, v4

    move-object v3, v5

    move-object v4, v6

    move-object v5, v7

    move-object v6, v10

    move-object v7, v13

    invoke-direct/range {v0 .. v8}, Lcom/flyersoft/moonreaderp/PrefMisc$121;-><init>(Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;I)V

    const v1, 0x104000a

    .line 3373
    invoke-virtual {v9, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 3404
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    const/4 v0, 0x2

    if-ne v8, v0, :cond_7

    .line 3408
    invoke-static {v12, v11}, Lcom/flyersoft/moonreaderp/PrefMisc;->getDropboxAccountInfo(Landroid/widget/TextView;Landroid/widget/ProgressBar;)V

    return-void

    .line 3410
    :cond_7
    invoke-virtual {v11, v15}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public static showTipImage(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V
    .locals 1

    .line 1279
    new-instance v0, Lcom/flyersoft/views/picview/ComicView;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/picview/ComicView;-><init>(Landroid/content/Context;)V

    .line 1280
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p2, v0, Lcom/flyersoft/views/picview/ComicView;->backgroundColor:Ljava/lang/Integer;

    .line 1281
    invoke-virtual {v0, p1}, Lcom/flyersoft/views/picview/ComicView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1282
    invoke-static {p0}, Lcom/flyersoft/tools/A;->alertDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    .line 1283
    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 1284
    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-static {}, Lcom/flyersoft/tools/A;->sysAlertDialogWidth()I

    move-result p1

    const/4 p2, -0x2

    invoke-virtual {p0, p1, p2}, Landroid/view/Window;->setLayout(II)V

    return-void
.end method

.method private static sortBackupList(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2769
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2770
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "#"

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 2771
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " (std)"

    const-string v6, ".mrstd"

    .line 2772
    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    const-string v6, " (pro)"

    const-string v7, ".mrpro"

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2773
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2775
    :cond_0
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$102;

    invoke-direct {v1}, Lcom/flyersoft/moonreaderp/PrefMisc$102;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 2780
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2781
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2782
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    return-void
.end method

.method private static uploadBackupFileToCloud(ILjava/lang/String;Ljava/lang/String;Landroid/os/Handler;Landroid/content/Context;)V
    .locals 7

    .line 3038
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object v0

    .line 3039
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/Backup/"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3040
    invoke-static {p2}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    if-nez p3, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/flyersoft/moonreaderp/PrefMisc$113;

    invoke-direct {p0, p4, p3}, Lcom/flyersoft/moonreaderp/PrefMisc$113;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    :goto_0
    move-object v5, p0

    const/4 v6, 0x0

    move-object v4, p2

    .line 3039
    invoke-virtual/range {v1 .. v6}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V

    return-void
.end method

.method protected static validateCloud(Landroid/app/Dialog;I)Z
    .locals 5

    .line 3143
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    .line 3144
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_3

    const/4 v1, 0x0

    if-eqz p0, :cond_2

    const/4 v3, 0x6

    if-eq p1, v3, :cond_1

    const/16 v3, 0x8

    if-ne p1, v3, :cond_0

    goto :goto_0

    .line 3149
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->connect_wait:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    .line 3150
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/cloud/Cloud;->validateAccount(Landroid/content/Context;)Z

    goto :goto_1

    .line 3147
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p0, v1, p1}, Lcom/flyersoft/components/cloud/Cloud;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    :cond_2
    :goto_1
    return v1

    :cond_3
    return v2
.end method

.method static verifyReplacementOk(Landroid/content/Context;)Z
    .locals 8

    .line 1614
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1616
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    const/4 v2, 0x1

    if-eqz v0, :cond_8

    .line 1618
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    .line 1619
    :goto_0
    sget-object v5, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    sub-int/2addr v5, v2

    if-ge v4, v5, :cond_4

    .line 1620
    sget-object v5, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1621
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1622
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1623
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_3

    .line 1625
    :try_start_0
    const-string v7, "*"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v2, :cond_1

    .line 1626
    invoke-virtual {v6, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1627
    :cond_1
    sget-boolean v7, Lcom/flyersoft/tools/A;->names_replace_with_regular_expression:Z

    if-eqz v7, :cond_2

    .line 1628
    invoke-virtual {v0, v6, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1630
    :cond_2
    invoke-virtual {v0, v6, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 1632
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1633
    sget v2, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v2, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return v1

    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1637
    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v3, :cond_5

    if-eqz v0, :cond_7

    :cond_5
    const/16 v4, 0x3e8

    const/16 v5, 0xc8

    if-le v3, v4, :cond_6

    if-lt v0, v5, :cond_7

    :cond_6
    if-le v3, v5, :cond_8

    .line 1638
    div-int/lit8 v3, v3, 0x2

    if-ge v0, v3, :cond_8

    .line 1639
    :cond_7
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->names_replacement_failed:I

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return v1

    :cond_8
    return v2
.end method


# virtual methods
.method public dismiss()V
    .locals 3

    .line 392
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->forFuncSearch:Z

    if-eqz v0, :cond_0

    .line 393
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 396
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 397
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 398
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 399
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    .line 400
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/A;->prefmp:I

    .line 401
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->saveOptions()V

    .line 402
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    .line 403
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method public initView()V
    .locals 7

    .line 116
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->forFuncSearch:Z

    if-nez v0, :cond_0

    .line 117
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    .line 118
    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->settingButton1:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->b1:Landroid/widget/Button;

    .line 119
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->settingButton2:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->b2:Landroid/widget/Button;

    .line 120
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->backupB:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->backupB:Landroid/widget/Button;

    .line 121
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->restoreB:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreB:Landroid/widget/Button;

    .line 123
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bottomBarTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->bottomBarTv:Landroid/widget/TextView;

    .line 124
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->dictTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->dictTv:Landroid/widget/TextView;

    .line 125
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->fb2Tv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fb2Tv:Landroid/widget/TextView;

    .line 126
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->imageTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->imageTv:Landroid/widget/TextView;

    .line 127
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->noteTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->noteTv:Landroid/widget/TextView;

    .line 128
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->linkTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->linkTv:Landroid/widget/TextView;

    .line 129
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->nameReplace:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->nameReplace:Landroid/widget/TextView;

    .line 130
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->appOptions:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->appOptionsB:Landroid/widget/TextView;

    .line 131
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->autoScrollB:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->autoScrollB:Landroid/widget/TextView;

    .line 132
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->debugTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->debugTv:Landroid/widget/TextView;

    .line 133
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pmSpeakMore:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->speakMoreButton:Landroid/view/View;

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->debugTv:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->myDebugTag:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v4, 0x8

    if-le v1, v2, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->replacement_in_main_menu:Z

    if-eqz v0, :cond_3

    .line 137
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->nameReplace:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 138
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->nameReplace2:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 141
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->appOptionsB:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v5, "("

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->app:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ") "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->menu_options:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->appOptionsB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    const/4 v0, 0x1

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    .line 145
    :goto_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fb2Tv:Landroid/widget/TextView;

    if-eqz v0, :cond_5

    const/4 v5, 0x0

    goto :goto_2

    :cond_5
    const/16 v5, 0x8

    :goto_2
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 146
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fb2Tv2:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    goto :goto_3

    :cond_6
    const/16 v0, 0x8

    :goto_3
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 148
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->bottomBarTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->dictTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->fb2Tv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->imageTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 152
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->linkTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->noteTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->debugTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 155
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->b1:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->b2:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->backupB:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreB:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->nameReplace:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->autoScrollB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 161
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->speakMoreButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmTtsDivides:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    sget v1, Lcom/flyersoft/tools/A;->tts_divide:I

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 164
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->loadSettings()V

    .line 166
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetBar:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetRemaining:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetIndent:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSet2Page:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmFullscreenOp:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmBionicTip:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetSound:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetRuler:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetFling:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetTilt:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetLed:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetScreenAwake:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 178
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetCSS:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetFont:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetFontSize:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetTTS:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetRemind1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pmSetRemind2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->setEdge:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->setSaveFile:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pcReset:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->speakLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v1

    if-eqz v1, :cond_7

    const/4 v1, 0x0

    goto :goto_4

    :cond_7
    const/16 v1, 0x8

    :goto_4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 189
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->speakLay2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x0

    goto :goto_5

    :cond_8
    const/16 v1, 0x8

    :goto_5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 190
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->proLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v1

    if-eqz v1, :cond_9

    goto :goto_6

    :cond_9
    const/16 v3, 0x8

    :goto_6
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 192
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->autoScrollB:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->getAutoScrollTitle(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->forFuncSearch:Z

    if-nez v0, :cond_a

    sget v0, Lcom/flyersoft/tools/A;->prefmp:I

    if-lez v0, :cond_a

    .line 195
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 206
    :cond_a
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_b

    invoke-static {}, Lcom/flyersoft/components/cloud/Gdrive;->hasLoginHistory()Z

    move-result v0

    if-nez v0, :cond_b

    .line 207
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gdriveSplit:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 208
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gdriveLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 209
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gdriveTip:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$2;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 225
    :cond_b
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gdriveTip:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 22

    move-object/from16 v1, p0

    move-object/from16 v7, p1

    .line 453
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pcReset:I

    const/high16 v6, 0x1040000

    const v11, 0x104000a

    const/4 v12, 0x0

    if-ne v0, v2, :cond_0

    .line 454
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    .line 455
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 456
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->reset:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\"?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 456
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$8;

    invoke-direct {v2, v1}, Lcom/flyersoft/moonreaderp/PrefMisc$8;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    .line 458
    invoke-virtual {v0, v11, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 466
    invoke-virtual {v0, v6, v12}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 469
    :cond_0
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetBar:I

    if-ne v0, v2, :cond_1

    .line 470
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->show()V

    .line 473
    :cond_1
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetIndent:I

    const-string v8, ""

    const/4 v9, 0x5

    const/4 v10, 0x2

    const/4 v13, 0x0

    if-ne v0, v2, :cond_4

    .line 474
    new-array v0, v9, [Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x2

    :goto_0
    if-ge v2, v9, :cond_3

    .line 477
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v2

    .line 478
    sget v4, Lcom/flyersoft/tools/A;->indentLength:I

    if-ne v2, v4, :cond_2

    move v3, v2

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 481
    :cond_3
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->indent_length:I

    invoke-virtual {v2, v4}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    .line 482
    invoke-virtual {v2, v0, v3, v12}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$9;

    invoke-direct {v2, v1}, Lcom/flyersoft/moonreaderp/PrefMisc$9;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    .line 483
    invoke-virtual {v0, v11, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 488
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 491
    :cond_4
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetRemaining:I

    const/high16 v3, 0x41000000    # 8.0f

    const/high16 v4, 0x41800000    # 16.0f

    if-ne v0, v2, :cond_5

    .line 492
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 493
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v14

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v15

    invoke-virtual {v0, v2, v5, v14, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 494
    new-instance v2, Landroid/widget/CheckBox;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 495
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 496
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->remaining_time_in_statusbar:I

    invoke-virtual {v2, v5}, Landroid/widget/CheckBox;->setText(I)V

    .line 497
    sget-boolean v5, Lcom/flyersoft/tools/A;->remaingTimeInStatusBar:Z

    invoke-virtual {v2, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 498
    new-instance v5, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-direct {v5, v14}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v14, Lcom/flyersoft/moonreaderp/R$string;->show_remaining_time:I

    .line 499
    invoke-virtual {v5, v14}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v5

    .line 500
    invoke-virtual {v5, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefMisc$10;

    invoke-direct {v5, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$10;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/CheckBox;)V

    .line 501
    invoke-virtual {v0, v11, v5}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 506
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 509
    :cond_5
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetRuler:I

    const/4 v14, 0x1

    if-ne v0, v2, :cond_6

    .line 510
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v14}, Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V

    .line 513
    :cond_6
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetSound:I

    if-ne v0, v2, :cond_7

    .line 514
    invoke-direct {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->setPageSound()V

    .line 517
    :cond_7
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmBionicTip:I

    if-ne v0, v2, :cond_8

    .line 518
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 519
    invoke-virtual {v0, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 520
    new-instance v2, Landroid/widget/ImageView;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 521
    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 522
    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->about_focus_reading:I

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    const/high16 v5, 0x43340000    # 180.0f

    .line 523
    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    const/4 v15, -0x1

    invoke-virtual {v0, v2, v15, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 527
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 528
    invoke-virtual {v2, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 529
    invoke-virtual {v0, v11, v12}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 531
    :cond_8
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetFtp:I

    if-ne v0, v2, :cond_9

    .line 532
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v2, 0x8

    invoke-static {v0, v2, v13}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    .line 534
    :cond_9
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetWebDav:I

    if-ne v0, v2, :cond_a

    .line 535
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x6

    invoke-static {v0, v2, v13}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    .line 537
    :cond_a
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetDropbox:I

    if-ne v0, v2, :cond_b

    .line 538
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v10, v13}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    .line 540
    :cond_b
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetGdrive:I

    const/4 v15, 0x4

    if-ne v0, v2, :cond_c

    .line 541
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v15, v13}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    .line 544
    :cond_c
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSet2Page:I

    if-ne v0, v2, :cond_d

    .line 545
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->dual_page:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 546
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-virtual {v0, v2, v3, v5, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 547
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cb2:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/widget/CheckBox;

    .line 548
    sget-boolean v2, Lcom/flyersoft/tools/A;->dualPageOnlyLandscape:Z

    invoke-virtual {v3, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 549
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cb:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 550
    sget-boolean v4, Lcom/flyersoft/tools/A;->pageStyle2PageMode:Z

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 552
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->cb3:I

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    .line 553
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->auto_dual_for_foldable:I

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setText(I)V

    .line 554
    sget-boolean v5, Lcom/flyersoft/tools/A;->auto2PageForFoldable:Z

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 556
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->fontTv:I

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v6

    sget v9, Lcom/flyersoft/moonreaderp/R$string;->font_size:I

    invoke-virtual {v6, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "(\u00b1)"

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 557
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->fontEt:I

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 558
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v9, Lcom/flyersoft/tools/A;->dualFontSizeAdd:F

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 560
    new-instance v6, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v6, v9}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v9, Lcom/flyersoft/moonreaderp/R$string;->dual_page:I

    invoke-virtual {v6, v9}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v6

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$11;

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefMisc$11;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;)V

    .line 561
    invoke-virtual {v6, v11, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 577
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 580
    :cond_d
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmFullscreenOp:I

    if-ne v0, v2, :cond_e

    .line 581
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1, v14}, Lcom/flyersoft/moonreaderp/PrefMisc;->showFullScreenSettings(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc;Z)Landroid/view/View;

    .line 584
    :cond_e
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetTilt:I

    if-ne v0, v2, :cond_f

    .line 585
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v12}, Lcom/flyersoft/moonreaderp/PrefMisc;->setTiltOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 588
    :cond_f
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetFling:I

    if-ne v0, v2, :cond_10

    .line 589
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->edge_options:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 591
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->Spinner01:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Spinner;

    .line 592
    new-instance v3, Landroid/widget/ArrayAdapter;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 593
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/PrefVisual;->getNewFlipAnimations(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v5

    const v6, 0x1090008

    invoke-direct {v3, v4, v6, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v4, 0x1090009

    .line 594
    invoke-virtual {v3, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 595
    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 596
    sget v3, Lcom/flyersoft/tools/A;->hori_fling_animation:I

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setSelection(I)V

    .line 597
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->tv1:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->flip_animation:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 598
    new-instance v3, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->allow_scroll_horizontally:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v3

    .line 599
    invoke-virtual {v3, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$12;

    invoke-direct {v3, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$12;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/Spinner;)V

    invoke-virtual {v0, v11, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 603
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 606
    :cond_10
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetTTS:I

    if-ne v0, v2, :cond_11

    .line 607
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->openTtsOptions(Landroid/content/Context;)V

    .line 610
    :cond_11
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetRemind1:I

    if-ne v0, v2, :cond_12

    .line 611
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->remind1:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 613
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind1Time:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v4, Lcom/flyersoft/tools/A;->remind1Time:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 615
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind1Text:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->remind1text:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 616
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind1Text:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2, v13}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 617
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 618
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->remindlabel:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$13;

    invoke-direct {v3, v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$13;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;)V

    .line 619
    invoke-virtual {v2, v11, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 629
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 632
    :cond_12
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetRemind2:I

    if-ne v0, v2, :cond_13

    .line 633
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->remind2:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 635
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind2Time:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/flyersoft/tools/A;->remind2TimeHour:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/flyersoft/tools/A;->remind2TimeMinute:I

    .line 636
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getMinuteTag(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 635
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 637
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind2Text:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    sget-object v3, Lcom/flyersoft/tools/A;->remind2Text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 638
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmRemind2Time:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$14;

    invoke-direct {v3, v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$14;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 650
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 651
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->remind_me_at_time:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$15;

    invoke-direct {v3, v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$15;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;)V

    .line 652
    invoke-virtual {v2, v11, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 657
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 660
    :cond_13
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSpeakMore:I

    if-ne v0, v2, :cond_14

    .line 661
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v12, v14}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showTTSMoreOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Landroid/view/View;

    .line 664
    :cond_14
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetFontSize:I

    if-ne v0, v2, :cond_15

    .line 665
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->edge_options:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 667
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->Spinner01:I

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Spinner;

    .line 668
    sget v3, Lcom/flyersoft/tools/A;->fontsize_edge:I

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setSelection(I)V

    .line 669
    new-instance v3, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->font_size:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$16;

    invoke-direct {v3, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$16;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/Spinner;)V

    .line 670
    invoke-virtual {v0, v11, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 674
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 677
    :cond_15
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetCSS:I

    if-ne v0, v2, :cond_16

    .line 678
    invoke-direct {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->do_SetCSS()V

    .line 681
    :cond_16
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetFont:I

    if-ne v0, v2, :cond_17

    .line 682
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-static {v0, v12}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCssFontOptions(Landroid/app/Dialog;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    .line 685
    :cond_17
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetScreenAwake:I

    if-ne v0, v2, :cond_1d

    .line 687
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "+1 "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->tts_stop_time2:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 688
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "+2 "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->tts_stop_time2:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 689
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "+5 "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->tts_stop_time2:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 690
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "+10 "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->tts_stop_time2:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 691
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "+30 "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->tts_stop_time2:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 692
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "+\u221e "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->tts_stop_time2:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    filled-new-array/range {v16 .. v21}, [Ljava/lang/String;

    move-result-object v0

    .line 694
    sget v2, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    if-ne v2, v14, :cond_18

    const/4 v9, 0x0

    goto :goto_1

    .line 696
    :cond_18
    sget v2, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    if-ne v2, v10, :cond_19

    const/4 v9, 0x1

    goto :goto_1

    .line 698
    :cond_19
    sget v2, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_1a

    const/4 v9, 0x2

    goto :goto_1

    .line 700
    :cond_1a
    sget v2, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    const/16 v4, 0xa

    if-ne v2, v4, :cond_1b

    const/4 v9, 0x3

    goto :goto_1

    .line 702
    :cond_1b
    sget v2, Lcom/flyersoft/tools/A;->screenAwakeExtend:I

    const/16 v4, 0x1e

    if-ne v2, v4, :cond_1c

    const/4 v9, 0x4

    goto :goto_1

    :cond_1c
    const/4 v9, 0x5

    .line 705
    :goto_1
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->keep_screen_awake:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    .line 706
    invoke-virtual {v2, v0, v9, v12}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$17;

    invoke-direct {v2, v1}, Lcom/flyersoft/moonreaderp/PrefMisc$17;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    .line 707
    invoke-virtual {v0, v11, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 729
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 732
    :cond_1d
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pmSetLed:I

    if-ne v0, v2, :cond_1e

    .line 733
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v14, v14}, Lcom/flyersoft/moonreaderp/PrefMisc;->setBrightnessOptions(Landroid/content/Context;ZZ)Landroid/view/View;

    .line 736
    :cond_1e
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->bottomBarTv:Landroid/widget/TextView;

    if-ne v7, v0, :cond_1f

    .line 737
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v14}, Lcom/flyersoft/components/DragSort/ReaderBar;->customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;

    .line 740
    :cond_1f
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->dictTv:Landroid/widget/TextView;

    if-ne v7, v0, :cond_20

    .line 741
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v12, v13, v14}, Lcom/flyersoft/components/DragSort/SelectBar;->customizeSelectBar(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;ZZ)Landroid/view/View;

    .line 744
    :cond_20
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->b1:Landroid/widget/Button;

    if-ne v7, v0, :cond_22

    .line 745
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->cancel()V

    .line 746
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_21

    .line 747
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showVisualOptions()V

    goto :goto_2

    .line 749
    :cond_21
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/moonreaderp/PrefVisual;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->show()V

    .line 752
    :cond_22
    :goto_2
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->b2:Landroid/widget/Button;

    if-ne v7, v0, :cond_24

    .line 753
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->cancel()V

    .line 754
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_23

    .line 755
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showControlOptions()V

    goto :goto_3

    .line 757
    :cond_23
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/moonreaderp/PrefControl;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefControl;->show()V

    .line 760
    :cond_24
    :goto_3
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->backupB:Landroid/widget/Button;

    if-ne v7, v0, :cond_25

    .line 761
    invoke-direct {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->saveOptions()V

    .line 762
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->doBackup(Landroid/app/Dialog;)V

    .line 765
    :cond_25
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreB:Landroid/widget/Button;

    if-ne v7, v0, :cond_26

    .line 766
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selfPref:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->doRestore(Landroid/app/Dialog;)V

    .line 769
    :cond_26
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->nameReplace:Landroid/widget/TextView;

    if-ne v7, v0, :cond_27

    .line 770
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$18;

    invoke-direct {v2, v1}, Lcom/flyersoft/moonreaderp/PrefMisc$18;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    invoke-static {v0, v2, v12}, Lcom/flyersoft/moonreaderp/PrefMisc;->showReplacmentDialog(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc$OnAfterVerifyReplacement;Ljava/lang/String;)V

    .line 780
    :cond_27
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->appOptionsB:Landroid/widget/TextView;

    if-ne v7, v0, :cond_28

    .line 781
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v12}, Lcom/flyersoft/moonreaderp/PrefMisc;->showShelfOptions(Landroid/content/Context;Ljava/lang/String;)V

    .line 784
    :cond_28
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->autoScrollB:Landroid/widget/TextView;

    if-ne v7, v0, :cond_29

    .line 785
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v14}, Lcom/flyersoft/moonreaderp/PrefMisc;->showAutoScrollSettings(Landroid/content/Context;Z)Landroid/view/View;

    .line 788
    :cond_29
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->debugTv:Landroid/widget/TextView;

    if-ne v7, v0, :cond_2e

    .line 790
    new-instance v0, Ljava/io/File;

    const-string v2, "/sdcard/Download/settings.txt"

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 791
    new-instance v2, Ljava/io/File;

    const-string v3, "/sdcard/settings.txt"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 792
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_2a

    goto :goto_4

    .line 794
    :cond_2a
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v3

    if-nez v3, :cond_2c

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_2c

    :cond_2b
    move-object v0, v2

    goto :goto_4

    .line 796
    :cond_2c
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 797
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v5

    cmp-long v9, v3, v5

    if-lez v9, :cond_2b

    goto :goto_4

    :cond_2d
    move-object v0, v12

    :goto_4
    if-eqz v0, :cond_2e

    .line 799
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Load settings file: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 800
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/options1002.xml"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v14}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 801
    invoke-static {v13}, Ljava/lang/System;->exit(I)V

    .line 805
    :cond_2e
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->fb2Tv:Landroid/widget/TextView;

    if-ne v7, v0, :cond_2f

    .line 806
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->pref_edit_fb2_css:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 807
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cssEt:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 808
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/fb2_css"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 809
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 810
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 812
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->selectB:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$19;

    invoke-direct {v4, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$19;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/EditText;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 817
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->copyB:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$20;

    invoke-direct {v4, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$20;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/EditText;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 830
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->pasteB:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$21;

    invoke-direct {v4, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$21;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/EditText;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 842
    new-instance v3, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    const-string v4, "FB2 CSS"

    .line 843
    invoke-virtual {v3, v4}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v3

    .line 844
    invoke-virtual {v3, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$22;

    invoke-direct {v3, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$22;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/EditText;)V

    .line 845
    invoke-virtual {v0, v11, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v2, 0x1040000

    .line 856
    invoke-virtual {v0, v2, v12}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 857
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 860
    :cond_2f
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->linkTv:Landroid/widget/TextView;

    if-ne v7, v0, :cond_31

    .line 861
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->link_color:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    .line 862
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->c1:I

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 863
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->c12:I

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 864
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->c2:I

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 865
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->c22:I

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 866
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->cpdf:I

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 867
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->cb:I

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Landroid/widget/CheckBox;

    .line 869
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->link_colors:I

    invoke-virtual {v0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 870
    const-string v10, "s"

    invoke-virtual {v0, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_30

    .line 871
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v10

    sub-int/2addr v10, v14

    invoke-virtual {v0, v13, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 872
    :cond_30
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (PDF)"

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 873
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->tvpdf:I

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 875
    sget-boolean v10, Lcom/flyersoft/tools/A;->disableLinkColor:Z

    invoke-virtual {v15, v10}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 876
    sget v10, Lcom/flyersoft/tools/A;->linkColor:I

    invoke-virtual {v2, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 877
    sget v10, Lcom/flyersoft/tools/A;->linkColorNight:I

    invoke-virtual {v3, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 878
    sget v10, Lcom/flyersoft/tools/A;->linkVisitedColor:I

    invoke-virtual {v4, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 879
    sget v10, Lcom/flyersoft/tools/A;->linkVisitedColorNight:I

    invoke-virtual {v5, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 880
    sget v10, Lcom/radaee/pdf/Global;->annotTransparencyColor:I

    invoke-virtual {v6, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 881
    new-instance v10, Lcom/flyersoft/moonreaderp/PrefMisc$23;

    invoke-direct {v10, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$23;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;)V

    invoke-virtual {v2, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 893
    new-instance v10, Lcom/flyersoft/moonreaderp/PrefMisc$24;

    invoke-direct {v10, v1, v3}, Lcom/flyersoft/moonreaderp/PrefMisc$24;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;)V

    invoke-virtual {v3, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 905
    new-instance v10, Lcom/flyersoft/moonreaderp/PrefMisc$25;

    invoke-direct {v10, v1, v4}, Lcom/flyersoft/moonreaderp/PrefMisc$25;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;)V

    invoke-virtual {v4, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 917
    new-instance v10, Lcom/flyersoft/moonreaderp/PrefMisc$26;

    invoke-direct {v10, v1, v5}, Lcom/flyersoft/moonreaderp/PrefMisc$26;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;)V

    invoke-virtual {v5, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 929
    new-instance v10, Lcom/flyersoft/moonreaderp/PrefMisc$27;

    invoke-direct {v10, v1, v0, v6}, Lcom/flyersoft/moonreaderp/PrefMisc$27;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Ljava/lang/String;Landroid/view/View;)V

    invoke-virtual {v6, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 944
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvResetSpace:I

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$28;

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/moonreaderp/PrefMisc$28;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {v10, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 962
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->link_colors:I

    .line 963
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 964
    invoke-virtual {v0, v9}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$29;

    invoke-direct {v2, v1, v15}, Lcom/flyersoft/moonreaderp/PrefMisc$29;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/CheckBox;)V

    .line 965
    invoke-virtual {v0, v11, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 974
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 977
    :cond_31
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->noteTv:Landroid/widget/TextView;

    if-ne v7, v0, :cond_32

    .line 978
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->popup_note_color:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    .line 979
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->c1:I

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 980
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->c12:I

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 981
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->c1_2:I

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 982
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->c12_2:I

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 983
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v9

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->font_color:I

    invoke-virtual {v9, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " ("

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v10

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->day_theme:I

    invoke-virtual {v10, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ")"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 984
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v13

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->font_color:I

    invoke-virtual {v13, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v8

    sget v13, Lcom/flyersoft/moonreaderp/R$string;->night_theme:I

    invoke-virtual {v8, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 985
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v15

    sget v14, Lcom/flyersoft/moonreaderp/R$string;->background_color:I

    invoke-virtual {v15, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v14

    sget v15, Lcom/flyersoft/moonreaderp/R$string;->day_theme:I

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 986
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v15

    sget v11, Lcom/flyersoft/moonreaderp/R$string;->background_color:I

    invoke-virtual {v15, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v9

    sget v11, Lcom/flyersoft/moonreaderp/R$string;->night_theme:I

    invoke-virtual {v9, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 987
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->tv1:I

    invoke-virtual {v6, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 988
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->tv1_2:I

    invoke-virtual {v6, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 989
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->tv2:I

    invoke-virtual {v6, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 990
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->tv2_2:I

    invoke-virtual {v6, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 992
    sget v10, Lcom/flyersoft/tools/A;->noteTextColor:I

    invoke-virtual {v2, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 993
    sget v10, Lcom/flyersoft/tools/A;->noteBackColor:I

    invoke-virtual {v3, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 994
    sget v10, Lcom/flyersoft/tools/A;->noteTextColorNight:I

    invoke-virtual {v4, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 995
    sget v10, Lcom/flyersoft/tools/A;->noteBackColorNight:I

    invoke-virtual {v5, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 997
    new-instance v10, Lcom/flyersoft/moonreaderp/PrefMisc$30;

    invoke-direct {v10, v1, v0, v2}, Lcom/flyersoft/moonreaderp/PrefMisc$30;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Ljava/lang/String;Landroid/view/View;)V

    invoke-virtual {v2, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1009
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$31;

    invoke-direct {v0, v1, v13, v3}, Lcom/flyersoft/moonreaderp/PrefMisc$31;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Ljava/lang/String;Landroid/view/View;)V

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1021
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$32;

    invoke-direct {v0, v1, v8, v4}, Lcom/flyersoft/moonreaderp/PrefMisc$32;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Ljava/lang/String;Landroid/view/View;)V

    invoke-virtual {v4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1033
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$33;

    invoke-direct {v0, v1, v9, v5}, Lcom/flyersoft/moonreaderp/PrefMisc$33;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Ljava/lang/String;Landroid/view/View;)V

    invoke-virtual {v5, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1046
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvResetSpace:I

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$34;

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefMisc$34;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {v8, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1059
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->popup_note_color:I

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v2, 0x104000a

    .line 1060
    invoke-virtual {v0, v2, v12}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1061
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 1064
    :cond_32
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefMisc;->imageTv:Landroid/widget/TextView;

    if-ne v7, v0, :cond_33

    .line 1065
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->showImageOptions(Landroid/content/Context;Z)Landroid/view/View;

    .line 1068
    :cond_33
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->setSaveFile:I

    if-ne v0, v2, :cond_35

    .line 1069
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1070
    sget-object v2, Lcom/flyersoft/tools/A;->attachment_save_path:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1071
    sget v2, Lcom/flyersoft/material/components/icons/R$drawable;->edit_text_holo_dark:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 1072
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_34

    .line 1073
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 1074
    :cond_34
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$35;

    invoke-direct {v2, v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$35;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/TextView;)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1086
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 1087
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    const/4 v5, 0x3

    invoke-static {v3, v4, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    .line 1088
    invoke-virtual {v2, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v2, 0x104000a

    invoke-virtual {v0, v2, v12}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 1091
    :cond_35
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v0

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->setEdge:I

    if-ne v0, v2, :cond_36

    .line 1092
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->edge_touch:I

    invoke-virtual {v0, v2, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroid/widget/LinearLayout;

    .line 1093
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ltv:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$array;->edge_list:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1094
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->rtv:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$array;->edge_list:I

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1095
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->ttv:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$array;->edge_list:I

    const/4 v4, 0x2

    invoke-static {v2, v3, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1096
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->btv:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$array;->edge_list:I

    const/4 v5, 0x3

    invoke-static {v2, v3, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1097
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->lsb:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/widget/SeekBar;

    .line 1098
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->rsb:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/SeekBar;

    .line 1099
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tsb:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/SeekBar;

    .line 1100
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bsb:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/SeekBar;

    .line 1101
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->lspace:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 1102
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->rspace:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 1103
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tspace:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 1104
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bspace:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .line 1105
    sget v0, Lcom/flyersoft/tools/A;->ledge:I

    invoke-virtual {v2, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1106
    sget v0, Lcom/flyersoft/tools/A;->redge:I

    invoke-virtual {v3, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1107
    sget v0, Lcom/flyersoft/tools/A;->tedge:I

    invoke-virtual {v4, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1108
    sget v0, Lcom/flyersoft/tools/A;->bedge:I

    invoke-virtual {v5, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1109
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    sget v11, Lcom/flyersoft/tools/A;->ledge:I

    int-to-float v11, v11

    invoke-static {v11}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    iput v11, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1110
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    sget v11, Lcom/flyersoft/tools/A;->redge:I

    int-to-float v11, v11

    invoke-static {v11}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    iput v11, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1111
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    sget v11, Lcom/flyersoft/tools/A;->tedge:I

    int-to-float v11, v11

    invoke-static {v11}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    iput v11, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1112
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    sget v11, Lcom/flyersoft/tools/A;->bedge:I

    int-to-float v11, v11

    invoke-static {v11}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    iput v11, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1113
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$36;

    invoke-direct/range {v0 .. v10}, Lcom/flyersoft/moonreaderp/PrefMisc$36;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/widget/LinearLayout;)V

    .line 1140
    invoke-virtual {v2, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 1141
    invoke-virtual {v3, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 1142
    invoke-virtual {v4, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 1143
    invoke-virtual {v5, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 1144
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcReset:I

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v11

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$37;

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v10}, Lcom/flyersoft/moonreaderp/PrefMisc$37;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/widget/LinearLayout;)V

    invoke-virtual {v11, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1160
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual/range {p0 .. p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 1161
    invoke-virtual {v0, v10}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const v2, 0x104000a

    invoke-virtual {v0, v2, v12}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_36
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 99
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 100
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->initView()V

    .line 101
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 102
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 103
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 104
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc;->res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    .line 106
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 107
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 108
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    return-void
.end method

.method protected selectSoundFile()V
    .locals 5

    .line 1647
    sget-object v0, Lcom/flyersoft/tools/A;->pageSoundFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1648
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1649
    const-string v0, "/sdcard"

    .line 1650
    :cond_0
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1651
    const-string v0, "/"

    .line 1652
    :cond_1
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->sound_file:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$64;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$64;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    sget-object v0, Lcom/flyersoft/tools/A;->pageSoundFile:Ljava/lang/String;

    .line 1664
    invoke-virtual {v1, v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setInputFile(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setSoundFileOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method
