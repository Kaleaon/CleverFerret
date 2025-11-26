.class Lcom/flyersoft/components/DragSort/SelectBar$1;
.super Landroid/os/Handler;
.source "SelectBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/SelectBar;->customizeSelectBar(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;ZZ)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$dict_sp:Landroid/widget/Spinner;

.field final synthetic val$dict_sp2:Landroid/widget/Spinner;

.field final synthetic val$items:[Ljava/lang/CharSequence;

.field final synthetic val$start_time:J


# direct methods
.method constructor <init>(Landroid/os/Looper;Landroid/widget/Spinner;J[Ljava/lang/CharSequence;Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/Spinner;)V
    .locals 0

    .line 221
    iput-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$dict_sp:Landroid/widget/Spinner;

    iput-wide p3, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$start_time:J

    iput-object p5, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$items:[Ljava/lang/CharSequence;

    iput-object p6, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$context:Landroid/content/Context;

    iput-object p7, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p8, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$dict_sp2:Landroid/widget/Spinner;

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 223
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x64

    if-ne p1, v0, :cond_0

    .line 224
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$dict_sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->performClick()Z

    return-void

    .line 228
    :cond_0
    new-instance p1, Lcom/flyersoft/components/DragSort/SelectBar$1$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/DragSort/SelectBar$1$1;-><init>(Lcom/flyersoft/components/DragSort/SelectBar$1;)V

    .line 261
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$dict_sp:Landroid/widget/Spinner;

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 262
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$dict_sp2:Landroid/widget/Spinner;

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method
