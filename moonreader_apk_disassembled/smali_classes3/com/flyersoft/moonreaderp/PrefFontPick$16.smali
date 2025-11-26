.class Lcom/flyersoft/moonreaderp/PrefFontPick$16;
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

.field final synthetic val$sampleTv1:Landroid/widget/TextView;

.field final synthetic val$typeface:Landroid/graphics/Typeface;

.field final synthetic val$weightTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 586
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;->val$con:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;->val$sampleTv1:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;->val$weightTv:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;->val$typeface:Landroid/graphics/Typeface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 6

    add-int/lit8 p2, p2, 0x1

    if-eqz p3, :cond_0

    .line 591
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;->val$con:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;->val$sampleTv1:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;->val$weightTv:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$16;->val$typeface:Landroid/graphics/Typeface;

    mul-int/lit8 v4, p2, 0x64

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$smsetFontWeight(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/graphics/Typeface;IZ)V

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
