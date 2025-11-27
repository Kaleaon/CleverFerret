.class Lcom/flyersoft/moonreaderp/ActivityTxt$102;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showTTSMoreOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 11295
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$102;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 11298
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$102;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    .line 11299
    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->batteryOptTip:Z

    .line 11300
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$102;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->addToBatteryIgnoreFinal()V

    :cond_0
    return-void
.end method
