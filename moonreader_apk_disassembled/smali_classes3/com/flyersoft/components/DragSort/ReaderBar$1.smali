.class Lcom/flyersoft/components/DragSort/ReaderBar$1;
.super Ljava/lang/Object;
.source "ReaderBar.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/ReaderBar;->customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$base:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 195
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/ReaderBar$1;->val$base:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 1

    .line 198
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/ReaderBar$1;->val$base:Landroid/view/View;

    sget-boolean v0, Lcom/flyersoft/components/DragSort/ReaderBar;->doubleLineBar:Z

    invoke-static {p1, v0}, Lcom/flyersoft/components/DragSort/ReaderBar;->-$$Nest$smrenderLayout(Landroid/view/View;Z)V

    return-void
.end method
