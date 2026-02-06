;; title: yield-farm
;; version:
;; summary:
;; description:

;; Constants for contract ownership and error handling
(define-constant contract-owner tx-sender)
(define-constant ERR-OWNER-ONLY (err u100))
(define-constant ERR-INVALID-BOUNDS (err u101))
(define-constant ERR-INVALID-PARAMS (err u102))
(define-constant ERR-SEQUENCE-OVERFLOW (err u103))
(define-constant ERR-COOLDOWN-ACTIVE (err u104))
(define-constant ERR-BLACKLISTED (err u105))
(define-constant ERR-LOW-ENTROPY (err u106))
(define-constant ERR-MAINTENANCE (err u107))
(define-constant ERR-COMMIT-TIMEOUT (err u108))
(define-constant ERR-INVALID-REVEAL (err u109))
(define-constant ERR-INVALID-COMMITMENT (err u110))
(define-constant ERR-INVALID-ADDRESS (err u111))

;; Optimized configuration constants
(define-constant MAX-SEQUENCE-LENGTH u50) ;; Reduced for gas optimization
(define-constant COMMIT-REVEAL-TIMEOUT u144) ;; ~24 hours in blocks
(define-constant GENERATION-COOLDOWN u3) ;; Reduced cooldown for better UX
(define-constant MAX-RANGE u1000000)
(define-constant ZERO-BUFFER 0x0000000000000000000000000000000000000000000000000000000000000000)

;; Data variables
(define-data-var maintenance-mode bool false)
(define-data-var last-random uint u0)
(define-data-var current-seed (buff 32) 0x)
(define-data-var last-block uint u0)

;; Maps for commit-reveal scheme
(define-map commitments
  principal
  {
    commit-hash: (buff 32),
    commit-height: uint,
    revealed: bool,
  }
)