.class Lcom/flyersoft/moonreaderp/PrefMisc$122;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lio/reactivex/rxjava3/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->getDropboxAccountInfo(Landroid/widget/TextView;Landroid/widget/ProgressBar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/functions/Consumer<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$infoTv:Landroid/widget/TextView;

.field final synthetic val$pb:Landroid/widget/ProgressBar;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Landroid/widget/ProgressBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3439
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$122;->val$infoTv:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$122;->val$pb:Landroid/widget/ProgressBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1

    .line 3442
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->isError(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3443
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$122;->val$infoTv:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 3444
    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3445
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$122;->val$infoTv:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3448
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$122;->val$pb:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_1

    const/16 v0, 0x8

    .line 3449
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 3451
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method
