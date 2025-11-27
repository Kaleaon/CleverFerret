.class Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;
.super Ljava/lang/Object;
.source "CSSFontVariationSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FontVariationEntry"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field val:Ljava/lang/Float;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Float;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;->name:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontVariationSettings$FontVariationEntry;->val:Ljava/lang/Float;

    return-void
.end method
