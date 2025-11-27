.class Lcom/flyersoft/moonreaderp/PrefAbout$2;
.super Ljava/lang/Object;
.source "PrefAbout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefAbout;->displayPromotion()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefAbout;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefAbout;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 157
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$2;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 159
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$2;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefAbout;->superActivity:Landroid/app/Activity;

    const-string v0, "com.flyersoft.moonreaderp"

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->openAppInMarket(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method
