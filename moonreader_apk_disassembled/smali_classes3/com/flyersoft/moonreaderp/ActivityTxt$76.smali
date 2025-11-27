.class Lcom/flyersoft/moonreaderp/ActivityTxt$76;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->fixHuaWeiNotificationBarIssue()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6714
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$76;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 6717
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$76;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A;->isLightReadingText()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->setSystemBarsAppearance(Landroid/app/Activity;Z)V

    return-void
.end method
