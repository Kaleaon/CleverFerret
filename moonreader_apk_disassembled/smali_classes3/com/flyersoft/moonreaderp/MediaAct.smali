.class public Lcom/flyersoft/moonreaderp/MediaAct;
.super Landroid/app/Activity;
.source "MediaAct.java"


# instance fields
.field progressBar:Landroid/widget/ProgressBar;

.field video:Landroid/widget/VideoView;


# direct methods
.method static bridge synthetic -$$Nest$mdoFinish(Lcom/flyersoft/moonreaderp/MediaAct;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/MediaAct;->doFinish()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private doFinish()V
    .locals 3

    const/4 v0, 0x1

    .line 79
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Media Act finished."

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 80
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/MediaAct;->finish()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 27
    const-string v0, "video"

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 28
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/MediaAct;->requestWindowFeature(I)Z

    .line 29
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/MediaAct;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x400

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 31
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/MediaAct;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 32
    invoke-virtual {v1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 33
    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 34
    new-instance v1, Landroid/widget/VideoView;

    invoke-direct {v1, p0}, Landroid/widget/VideoView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    .line 35
    new-instance v1, Landroid/widget/MediaController;

    invoke-direct {v1, p0}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    .line 36
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    invoke-virtual {v1, v2}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 37
    const-string v2, "http"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 38
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    goto :goto_0

    .line 40
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    invoke-virtual {v2, v0}, Landroid/widget/VideoView;->setVideoPath(Ljava/lang/String;)V

    .line 41
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setMediaController(Landroid/widget/MediaController;)V

    .line 42
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    invoke-virtual {v0, p1}, Landroid/widget/VideoView;->setZOrderOnTop(Z)V

    .line 43
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    invoke-virtual {p1}, Landroid/widget/VideoView;->start()V

    .line 44
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    new-instance v0, Lcom/flyersoft/moonreaderp/MediaAct$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/MediaAct$1;-><init>(Lcom/flyersoft/moonreaderp/MediaAct;)V

    invoke-virtual {p1, v0}, Landroid/widget/VideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 49
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    new-instance v0, Lcom/flyersoft/moonreaderp/MediaAct$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/MediaAct$2;-><init>(Lcom/flyersoft/moonreaderp/MediaAct;)V

    invoke-virtual {p1, v0}, Landroid/widget/VideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 57
    new-instance p1, Landroid/widget/FrameLayout;

    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v0, -0x11cccccd

    .line 58
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 61
    new-instance v0, Landroid/widget/ProgressBar;

    invoke-direct {v0, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/MediaAct;->progressBar:Landroid/widget/ProgressBar;

    .line 62
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v1, 0x41f00000    # 30.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-direct {v0, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x11

    .line 63
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 64
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/MediaAct;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 67
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 68
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/MediaAct;->video:Landroid/widget/VideoView;

    invoke-virtual {p1, v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/MediaAct;->setContentView(Landroid/view/View;)V

    return-void

    .line 71
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/MediaAct;->doFinish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 73
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 74
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/MediaAct;->doFinish()V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .line 85
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onStart()V
    .locals 1

    .line 90
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 91
    sget v0, Lcom/flyersoft/tools/A;->screenState:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getScreenOrientation(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/MediaAct;->setRequestedOrientation(I)V

    return-void
.end method
