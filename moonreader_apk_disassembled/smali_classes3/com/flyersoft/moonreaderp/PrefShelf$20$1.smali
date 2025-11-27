.class Lcom/flyersoft/moonreaderp/PrefShelf$20$1;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Lcom/flyersoft/tools/T$FileResultOK;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf$20;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShelf$20;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf$20;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 842
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$20;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isResultOk(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 845
    sput-object v0, Lcom/flyersoft/tools/A;->custShelfNightDrawable:Landroid/graphics/drawable/Drawable;

    sput-object v0, Lcom/flyersoft/tools/A;->custShelfDayDrawable:Landroid/graphics/drawable/Drawable;

    .line 846
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$20$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$20;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf$20;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mloadCustShelfImage(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 848
    sput-boolean p1, Lcom/flyersoft/tools/A;->woodyChanged:Z

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
