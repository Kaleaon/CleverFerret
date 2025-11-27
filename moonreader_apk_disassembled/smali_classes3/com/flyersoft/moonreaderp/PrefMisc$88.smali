.class Lcom/flyersoft/moonreaderp/PrefMisc$88;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->do_SetCSS()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

.field final synthetic val$checked:[Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;[Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2281
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 2284
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    const/4 p2, 0x0

    aget-boolean p1, p1, p2

    sput-boolean p1, Lcom/flyersoft/tools/A;->cssFontStyle:Z

    .line 2285
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    const/4 v0, 0x1

    aget-boolean p1, p1, v0

    sput-boolean p1, Lcom/flyersoft/tools/A;->cssFontSize:Z

    .line 2286
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    const/4 v1, 0x2

    aget-boolean p1, p1, v1

    sput-boolean p1, Lcom/flyersoft/tools/A;->cssFontColor:Z

    .line 2287
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    const/4 v1, 0x3

    aget-boolean p1, p1, v1

    sput-boolean p1, Lcom/flyersoft/tools/A;->cssAlignment:Z

    .line 2288
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    const/4 v1, 0x4

    aget-boolean p1, p1, v1

    sput-boolean p1, Lcom/flyersoft/tools/A;->cssJustify:Z

    .line 2289
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    const/4 v1, 0x5

    aget-boolean p1, p1, v1

    sput-boolean p1, Lcom/flyersoft/tools/A;->cssIndent:Z

    .line 2290
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    const/4 v1, 0x6

    aget-boolean p1, p1, v1

    sput-boolean p1, Lcom/flyersoft/tools/A;->cssLineSpace:Z

    .line 2291
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->val$checked:[Z

    const/4 v1, 0x7

    aget-boolean p1, p1, v1

    sput-boolean p1, Lcom/flyersoft/tools/A;->cssOthers:Z

    .line 2292
    sget-boolean p1, Lcom/flyersoft/tools/A;->cssFontStyle:Z

    if-nez p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->cssFontColor:Z

    if-nez p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->cssFontSize:Z

    if-nez p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->cssAlignment:Z

    if-nez p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->cssJustify:Z

    if-nez p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->cssIndent:Z

    if-nez p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->cssLineSpace:Z

    if-nez p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->cssOthers:Z

    if-eqz p1, :cond_1

    :cond_0
    const/4 p2, 0x1

    :cond_1
    sput-boolean p2, Lcom/flyersoft/tools/A;->disableCSS:Z

    .line 2294
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->disableCSS:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2295
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->disableCSS:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean p2, Lcom/flyersoft/tools/A;->disableCSS:Z

    invoke-virtual {p1, p2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 2296
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$88;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->disableCSS:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-void
.end method
