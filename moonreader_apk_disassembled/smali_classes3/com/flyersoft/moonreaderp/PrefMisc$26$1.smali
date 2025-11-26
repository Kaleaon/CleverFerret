.class Lcom/flyersoft/moonreaderp/PrefMisc$26$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$26;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefMisc$26;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$26;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 921
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$26$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$26;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 1

    .line 923
    sput p1, Lcom/flyersoft/tools/A;->linkVisitedColorNight:I

    .line 924
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$26$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$26;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$26;->val$visitedNightView:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->linkVisitedColorNight:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method
