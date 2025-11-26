.class Lcom/flyersoft/moonreaderp/ActivityMain$34;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showAdFreeOptions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 3408
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$34;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 3410
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$34;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->adFreeSelected:I

    if-nez p1, :cond_0

    .line 3411
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$34;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/components/MrAd;->loadRewardedAd(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 3413
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$34;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->adFreeSelected:I

    const/4 p2, 0x1

    if-ne p1, p2, :cond_1

    .line 3414
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$34;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showSubscriptionDlg()V

    .line 3416
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$34;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->adFreeSelected:I

    const/4 p2, 0x2

    if-ne p1, p2, :cond_2

    .line 3417
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$34;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-string p2, "com.flyersoft.moonreaderp"

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->openAppInMarket(Landroid/content/Context;Ljava/lang/String;)Z

    :cond_2
    return-void
.end method
