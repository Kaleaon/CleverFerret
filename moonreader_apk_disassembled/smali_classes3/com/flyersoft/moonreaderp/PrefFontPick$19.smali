.class Lcom/flyersoft/moonreaderp/PrefFontPick$19;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->doFontWeight(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Typeface;ILcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$sampleTv1:Landroid/widget/TextView;

.field final synthetic val$sb1:Landroid/widget/SeekBar;

.field final synthetic val$typeface:Landroid/graphics/Typeface;

.field final synthetic val$weightTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;Landroid/widget/SeekBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 612
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$con:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$sampleTv1:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$weightTv:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$typeface:Landroid/graphics/Typeface;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$sb1:Landroid/widget/SeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 615
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$con:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$sampleTv1:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$weightTv:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$typeface:Landroid/graphics/Typeface;

    sget v4, Lcom/flyersoft/tools/A;->DEFAULT_WEIGHT:I

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$smsetFontWeight(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;IZ)V

    .line 616
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$19;->val$sb1:Landroid/widget/SeekBar;

    sget v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->weight:I

    div-int/lit8 v0, v0, 0x64

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    return-void
.end method
