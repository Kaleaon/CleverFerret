.class Lcom/flyersoft/moonreaderp/ActivityMain$29;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initDrawerLayout()V
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

    .line 3156
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 3158
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-nez p1, :cond_0

    .line 3159
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->openDrawer()V

    return-void

    .line 3161
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$29;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    return-void
.end method
