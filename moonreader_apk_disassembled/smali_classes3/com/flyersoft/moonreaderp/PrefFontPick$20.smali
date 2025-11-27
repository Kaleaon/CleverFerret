.class Lcom/flyersoft/moonreaderp/PrefFontPick$20;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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

.field final synthetic val$skewTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 628
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$20;->val$con:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$20;->val$sampleTv2:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$20;->val$skewTv:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2

    add-int/lit8 p2, p2, -0x64

    if-eqz p3, :cond_0

    .line 633
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$20;->val$con:Landroid/content/Context;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$20;->val$sampleTv2:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$20;->val$skewTv:Landroid/widget/TextView;

    int-to-float p2, p2

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr p2, v1

    invoke-static {p1, p3, v0, p2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$smsetFontSkew(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;F)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
