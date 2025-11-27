.class Lcom/flyersoft/moonreaderp/ActivityMain$122$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$122;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$122;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10375
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 10377
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1

    .line 10378
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$122;->items:[Ljava/lang/String;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iget p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    aget-object p1, p1, p2

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$122;->DEFAULT:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "default_fav"

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$122;->items:[Ljava/lang/String;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iget p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    aget-object p1, p1, p2

    :goto_0
    sput-object p1, Lcom/flyersoft/tools/A;->recent_fav_name:Ljava/lang/String;

    .line 10379
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$122;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mcreateFavRvAdapter(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    :cond_1
    return-void
.end method
