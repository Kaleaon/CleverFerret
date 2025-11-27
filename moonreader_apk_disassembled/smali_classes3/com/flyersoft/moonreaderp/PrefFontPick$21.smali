.class Lcom/flyersoft/moonreaderp/PrefFontPick$21;
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

.field final synthetic val$sampleTv2:Landroid/widget/TextView;

.field final synthetic val$sb2:Landroid/widget/SeekBar;

.field final synthetic val$skewTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/SeekBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 640
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$21;->val$con:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$21;->val$sampleTv2:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$21;->val$skewTv:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$21;->val$sb2:Landroid/widget/SeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 643
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$21;->val$con:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$21;->val$sampleTv2:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$21;->val$skewTv:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    const/high16 v3, 0x42c80000    # 100.0f

    mul-float v2, v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    div-float/2addr v2, v3

    invoke-static {p1, v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$smsetFontSkew(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;F)V

    .line 644
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$21;->val$sb2:Landroid/widget/SeekBar;

    sget v0, Lcom/flyersoft/moonreaderp/PrefFontPick;->skew:F

    mul-float v0, v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    add-int/lit8 v0, v0, 0x64

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    return-void
.end method
