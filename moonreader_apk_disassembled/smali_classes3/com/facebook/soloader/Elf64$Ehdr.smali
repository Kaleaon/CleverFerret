.class Lcom/facebook/soloader/Elf64$Ehdr;
.super Ljava/lang/Object;
.source "Elf64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/soloader/Elf64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Ehdr"
.end annotation


# static fields
.field public static final E_EHSIZE:I = 0x34

.field public static final E_ENTRY:I = 0x18

.field public static final E_FLAGS:I = 0x30

.field public static final E_IDENT:I = 0x0

.field public static final E_MACHINE:I = 0x12

.field public static final E_PHENTSIZE:I = 0x36

.field public static final E_PHNUM:I = 0x38

.field public static final E_PHOFF:I = 0x20

.field public static final E_SHENTSIZE:I = 0x3a

.field public static final E_SHNUM:I = 0x3c

.field public static final E_SHOFF:I = 0x28

.field public static final E_SHSTRNDX:I = 0x3e

.field public static final E_TYPE:I = 0x10

.field public static final E_VERSION:I = 0x14


# direct methods
.method constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
