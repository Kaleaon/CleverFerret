.class public Lcom/flyersoft/components/androidsvg/CSS;
.super Lcom/flyersoft/components/androidsvg/utils/CSSBase;
.source "CSS.java"


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSBase;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getFromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/CSS;
    .locals 1

    .line 31
    new-instance v0, Lcom/flyersoft/components/androidsvg/CSS;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/CSS;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
