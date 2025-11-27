.class Lcom/flyersoft/moonreaderp/PrefMisc$25$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$25;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefMisc$25;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$25;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 909
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$25$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$25;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 1

    .line 911
    sput p1, Lcom/flyersoft/tools/A;->linkVisitedColor:I

    .line 912
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$25$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$25;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$25;->val$visitedView:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->linkVisitedColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method
